package org.union.util;

import java.text.SimpleDateFormat;
import java.util.List;

import org.union.domain.CommunityVO;
import org.union.domain.ExtractVO;
import org.union.domain.MediaVO;
import org.union.domain.PortalVO;
import org.union.domain.SNSVO;

public class ListUtil {
	
	
	SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	

	public List<ExtractVO> listAddList(List<ExtractVO> list, List<ExtractVO> addList) {

		for (int i = 0; i < addList.size(); i++) {
			list.add(addList.get(i));
		}

		return list;
	}

	public List<ExtractVO> listAddSNSList(List<ExtractVO> list, List<SNSVO> addList) {

		try {

			for(int i = 0; i < addList.size(); i++) {
				ExtractVO vo = new ExtractVO();
				
				vo.setDomain("sns");
				vo.setDomainType(addList.get(i).getSns_name());
				vo.setKeyword(addList.get(i).getKeyword());
				vo.setTitle(addList.get(i).getSns_title());
				vo.setContent(addList.get(i).getSns_content());
				vo.setWriteDate(addList.get(i).getWriteDate());
				vo.setSns_idx(addList.get(i).getSns_idx());
				vo.setUrl(addList.get(i).getUrl());
				vo.setCreateDate(date.format(addList.get(i).getCreateDate()));
				vo.setTextType(addList.get(i).getTextType());
			
				list.add(vo);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public List<ExtractVO> listAddCommunityList(List<ExtractVO> list, List<CommunityVO> addList) {

		try {

			for(int i = 0; i < addList.size(); i++) {
				ExtractVO vo = new ExtractVO();
				
				vo.setDomain("community");
				vo.setDomainType(addList.get(i).getCommunity_name());
				vo.setKeyword(addList.get(i).getKeyword());
				vo.setTitle(addList.get(i).getCommunity_title());
				vo.setContent(addList.get(i).getCommunity_content());
				vo.setWriteDate(addList.get(i).getWriteDate());
				vo.setSns_idx(addList.get(i).getCommunity_idx());
				vo.setUrl(addList.get(i).getUrl());
				vo.setCreateDate(date.format(addList.get(i).getCreateDate()));
				vo.setTextType(addList.get(i).getTextType());
			
				list.add(vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public List<ExtractVO> listAddMediaList(List<ExtractVO> list, List<MediaVO> addList) {

		try {

			for(int i = 0; i < addList.size(); i++) {
				ExtractVO vo = new ExtractVO();
				
				vo.setDomain("media");
				vo.setDomainType(addList.get(i).getMedia_name());
				vo.setKeyword(addList.get(i).getKeyword());
				vo.setTitle(addList.get(i).getMedia_title());
				vo.setContent(addList.get(i).getMedia_content());
				vo.setWriteDate(addList.get(i).getWriteDate());
				vo.setSns_idx(addList.get(i).getMedia_idx());
				vo.setUrl(addList.get(i).getUrl());
				vo.setCreateDate(date.format(addList.get(i).getCreateDate()));
				vo.setTextType(addList.get(i).getTextType());
			
				list.add(vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public List<ExtractVO> listAddPortalList(List<ExtractVO> list, List<PortalVO> addList) {

		try {
			
			for(int i = 0; i < addList.size(); i++) {
				ExtractVO vo = new ExtractVO();
				
				vo.setDomain("portal");
				vo.setDomainType(addList.get(i).getPortal_name());
				vo.setKeyword(addList.get(i).getKeyword());
				vo.setTitle(addList.get(i).getPortal_title());
				vo.setWriteDate(addList.get(i).getWriteDate());
				vo.setSns_idx(addList.get(i).getPortal_idx());
				vo.setUrl(addList.get(i).getUrl());
				vo.setCreateDate(date.format(addList.get(i).getCreateDate()));
				vo.setTextType(addList.get(i).getTextType());
			
				list.add(vo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
}
