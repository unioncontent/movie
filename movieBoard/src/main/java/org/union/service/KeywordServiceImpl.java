package org.union.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.union.domain.ExtractVO;
import org.union.domain.IssueVO;
import org.union.domain.KeywordListVO;
import org.union.domain.KeywordVO;
import org.union.domain.SearchCriteria;
import org.union.domain.SwearwordVO;
import org.union.domain.UserVO;
import org.union.persistence.KeywordDAO;
import org.union.persistence.UserDAO;

@Service
public class KeywordServiceImpl implements KeywordService{

	
	@Autowired
	private KeywordDAO keywordDAO;
	
	@Autowired
	private UserDAO userDAO;
	
	@Override
	public List<KeywordVO> listByUser(Integer user_idx) {

		return keywordDAO.listByUser(user_idx);
	}
	
	@Override
	public List<KeywordVO> getKeyword(String keyword_main) {

		return keywordDAO.getKeyword(keyword_main);
	}

	@Override
	public List<ExtractVO> viewByKeyword(List<ExtractVO> list) {
		
		try {
			for(int i = 0; i < list.size(); i++) {

				KeywordVO keywordVO = keywordDAO.readByKeyword(list.get(i).getKeyword());
				
				if(keywordVO != null) {
					UserVO userVO = userDAO.read(keywordVO.getUser_idx());
					
					if(userVO != null) {
						list.get(i).setCompany(userVO.getUser_name());
						
					}else {
						list.get(i).setCompany(" ");
					}

				}
				
			}
		} catch (Exception e) {
			e.printStackTrace();
			
		}

		return list;
	}

	@Override
	public List<KeywordVO> listAll() {

		List<KeywordVO> keywordList = keywordDAO.listAll();

		try {
			
			
			for (KeywordVO keywordVO : keywordList) {
				keywordVO.setCompany_name(userDAO.read(keywordVO.getUser_idx()).getUser_name());
			}
			
			/*ArrayList<String> arr = new ArrayList<String>();
			String name = null;
			
			for (KeywordVO keywordVO : keywordList) {
				UserVO userVO = userDAO.read(keywordVO.getKeyword_idx());
				System.out.println(keywordMap.get(userVO.getUser_name()));
				if(keywordMap.get(userVO.getUser_name()) == null) {
					arr.add(keywordVO.getKeyword());
					name = userVO.getUser_name();
					System.out.println("arr: " + arr);
					System.out.println("name: " + name);
				
				}else {
					System.out.println("else");
					keywordMap.put(name, arr);
					
					arr = null;
					name = null;
				}
			}*/
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return keywordList;
	}
	
	@Override
	public List<KeywordVO> showboxListAll() {

		List<KeywordVO> keywordList = keywordDAO.showboxListAll();

		try {
			
			
			for (KeywordVO keywordVO : keywordList) {
				keywordVO.setCompany_name(userDAO.read(keywordVO.getUser_idx()).getUser_name());
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return keywordList;
	}

	@Override
	public List<KeywordListVO> listPage() {

		return keywordDAO.listPage();
	}

	@Override
	public void insertMain(KeywordListVO vo) {

		keywordDAO.createMain(vo);
	}

	@Override
	public List<KeywordVO> listByMain(String keyword_main) {

		return keywordDAO.listByMain(keyword_main);
	}

	@Override
	public void insertKeyword(KeywordVO vo) {

		keywordDAO.createKeyword(vo);
	}

	@Override
	public Integer checkMain(String keyword_main) {

		return keywordDAO.checkMain(keyword_main);
	}

	@Override
	public void removeMain(String keyword_main) {

		keywordDAO.deleteMain(keyword_main);
	}

	@Override
	public void remove(String keyword) {

		keywordDAO.delete(keyword);
	}

	@Override
	public KeywordVO view(String keyword) {

		return keywordDAO.read(keyword);
	}

	@Override
	public List<SwearwordVO> swearwordList() {

		return keywordDAO.swearwordList();
	}

	@Override
	public void swearwordCreate(SwearwordVO vo) {

		keywordDAO.swearwordCreate(vo);
	}

	@Override
	public void swearwordDelete(String swearword) {
		keywordDAO.swearwordDelete(swearword);
	}

	@Override
	public Integer checkSwearword(String swearword) {

		return keywordDAO.checkSwearword(swearword);
	}

	@Override
	public void stateUpdateOn(String keyword_main) {
		keywordDAO.stateUpdateOn(keyword_main);
		
	}

	@Override
	public void stateUpdateOff(String keyword_main) {
		keywordDAO.stateUpdateOff(keyword_main);
		
	}

	@Override
	public List<KeywordVO> keywordGetList(SearchCriteria cri) {

		return keywordDAO.keywordGetList(cri);
	}

	@Override
	public void createIssue(IssueVO vo) {

		keywordDAO.createIssue(vo);
	}

	@Override
	public List<IssueVO> issueList(SearchCriteria cri) {

		return keywordDAO.issueList(cri);
	}

	@Override
	public List<IssueVO> issueUpList(SearchCriteria cri) {

		return keywordDAO.issueUpList(cri);
	}

	@Override
	public void issueUpdate(IssueVO vo) {

		keywordDAO.issueUpdate(vo);
	}

	@Override
	public void issueDelete(Integer issue_idx) {

		keywordDAO.issueDelete(issue_idx);
	}
}
