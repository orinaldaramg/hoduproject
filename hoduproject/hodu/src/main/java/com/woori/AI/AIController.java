package com.woori.AI;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Base64;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.woori.AWS.AWSS3Service;
import com.woori.domain.PensionVO;
import com.woori.service.PensionService;


@Controller
public class AIController {
	
		@Inject
		private PensionService pensionService;

		@Autowired
		private AWSS3Service s3Service;
		
		private JSONObject jsonobject;

       
       private final String url="http://15.165.230.31:5000/detect";

       private String getBase64String(MultipartFile multipartFile) throws Exception {
           byte[] bytes = multipartFile.getBytes();
           return Base64.getEncoder().encodeToString(bytes);
       }
       
       @RequestMapping("AIRecommendChk.do")
       public String AIRecommendChk() {
    	   
    	   
    	   return "AIRecommendChk";
       }
       

       @RequestMapping("AI.do")
       public String requestToFlask(@RequestParam("image") MultipartFile image, RedirectAttributes redirect, HttpSession session) throws Exception {
           RestTemplate restTemplate = new RestTemplate();
           String fileName = image.getOriginalFilename();
           
           
           
           // Header set
           HttpHeaders httpHeaders = new HttpHeaders();
           httpHeaders.setContentType(MediaType.APPLICATION_JSON);
          

           // Body set
           MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
           String imageFileString = getBase64String(image);
           body.add("filename", fileName);
           body.add("image", imageFileString);

           // Message
           HttpEntity<?> requestMessage = new HttpEntity<>(body, httpHeaders);
           
           // Response 파싱
           String response = restTemplate.postForObject(url, requestMessage, String.class);
           
           JSONParser parser = new JSONParser();
           jsonobject = (JSONObject) parser.parse(response);

           
           // create output file
           File outputFile = new File("/home/ec2-user/temp.jpg");
           byte[] decodedBytes = Base64.getDecoder().decode((String)(jsonobject.get("image")));
           FileUtils.writeByteArrayToFile(outputFile, decodedBytes);
          
           s3Service.uploadObject(outputFile, "temp.jpg");
           outputFile.delete();

           redirect.addAttribute("AIDog", jsonobject.get("number"));

           
           return "redirect:/AIRecommendChk.do";
       }
       
       @RequestMapping("AIRecommend.do")
		public String AIRecommend(Model model, PensionVO vo) {
    	   
	    	try {
	    		List<PensionVO> aiRecommendList = pensionService.aiRecommend(vo);
		    	List<String> rating = new ArrayList<String>(Arrays.asList());
				List<String> price = new ArrayList<String>(Arrays.asList());
				
				for(int i =0; i<aiRecommendList.size();i++) {
					if(pensionService.rating(aiRecommendList.get(i).getPensionName()) != null) {
					rating.add(i, pensionService.rating(aiRecommendList.get(i).getPensionName()));
					} else {
						rating.add(i, "첫 후기를 작성해주세요.");
					}
					if(pensionService.price(aiRecommendList.get(i).getPensionName()) != null) {
						price.add(i, pensionService.price(aiRecommendList.get(i).getPensionName()));
					} else {
						price.add(i, "정보가 없습니다.");
					}
					
					model.addAttribute("rating", rating);
					model.addAttribute("price", price);
					model.addAttribute("aiRecommendLists", aiRecommendList);
						
				}
			} catch (NullPointerException e) {
				e.printStackTrace();
			}

			System.out.println("AIRecommend에서 실행 : " + jsonobject.get("number"));
			
			return "AIRecommend";
		}
       

   }