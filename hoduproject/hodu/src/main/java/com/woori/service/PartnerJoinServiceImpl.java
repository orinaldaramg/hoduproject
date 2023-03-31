package com.woori.service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.woori.dao.partnerJoinDAOImpl;
import com.woori.domain.partnerVO;

@Service
public class PartnerJoinServiceImpl implements PartnerJoinService {

	@Inject
	partnerJoinDAOImpl partnerJoin;
	
	@Override
	public void insertParnter(partnerVO pvo) {
		partnerJoin.insertPartner(pvo);
		
	}
	@Override
	public partnerVO viewPProfile(String partnerId) {
		return partnerJoin.viewPProfile(partnerId);
	}
	@Override
	public void editPProfile(partnerVO pvo) {
		partnerJoin.editPProfile(pvo);
	}
	
	// 아이디 중복체크
	@Override
	public int pidCheck(partnerVO pvo) {
		int result = partnerJoin.pidCheck(pvo);
		return result;
	}
	
	@Override
	public void deletePProfile(String partnerId, HttpSession psession) {
		partnerJoin.deletePProfile(partnerId);
		psession.invalidate();
	}
	

}