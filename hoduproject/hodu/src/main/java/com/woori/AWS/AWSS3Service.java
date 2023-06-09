package com.woori.AWS;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.model.DeleteObjectRequest;
import com.amazonaws.services.s3.model.PutObjectRequest;

@Service
public class AWSS3Service {

	@Autowired
	private AmazonS3 s3Client;
	
	@Value("hodu")
	private String bucketName;
	
	public  String uploadObject(MultipartFile multipartFile, String storedFileName) throws IOException {
		String filePath = "/"+storedFileName;
		s3Client.putObject(new PutObjectRequest(bucketName, filePath, multipartFile.getInputStream(),null));
		
		System.out.println(s3Client.getUrl(bucketName, filePath).toString());
		
		return s3Client.getUrl(bucketName, filePath).toString();
	}
	
	public  String uploadObject(File File, String storedFileName) throws IOException {
		String filePath = "/"+storedFileName;
		s3Client.putObject(bucketName, filePath, File);	
		System.out.println(s3Client.getUrl(bucketName, filePath).toString());
		
		return s3Client.getUrl(bucketName, filePath).toString();
	}
	

	
}
