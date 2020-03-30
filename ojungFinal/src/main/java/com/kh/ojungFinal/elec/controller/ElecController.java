package com.kh.ojungFinal.elec.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.ojungFinal.admin.model.vo.Member;
import com.kh.ojungFinal.common.FileRename;
import com.kh.ojungFinal.common.Pagination;
import com.kh.ojungFinal.common.vo.PageInfo;
import com.kh.ojungFinal.deptBoard.model.service.DeptBoardService;
import com.kh.ojungFinal.elec.model.service.ElecService;
import com.kh.ojungFinal.elec.model.vo.Sgn_doc;
import com.kh.ojungFinal.elec.model.vo.Sgn_docFile;
import com.kh.ojungFinal.elec.model.vo.SignListView;
import com.kh.ojungFinal.elec.model.vo.SignTobeListView;

@SessionAttributes({ "loginMember", "msg", "detailUrl" })
@Controller
@RequestMapping("/electronicSign/*")
public class ElecController {

	@Autowired
	ElecService elecService;
	@Autowired
	DeptBoardService deptBoardService; 

	// 소희 희원
	@RequestMapping("electronicSignList_drafter")
	public String electronicSignList_drafter(Model model,
			@RequestParam(value = "currentPage", required = false) Integer currentPage) {

		try {
			Member loginMember = (Member) model.getAttribute("loginMember");
			int memberNo = loginMember.getMemberNo();

			int listCount = elecService.getAllListCount(memberNo);
			System.out.println(listCount);

			if (currentPage == null)
				currentPage = 1;

			PageInfo pInf = Pagination.getPageInfo(5, 10, currentPage, listCount);

			List<SignListView> allList = elecService.selectAllList(memberNo, pInf);
			System.out.println("기안자 결재 전체 리스트 : " + allList);

			model.addAttribute("pInf", pInf);
			model.addAttribute("allList", allList);

		} catch (Exception e) {
		}
		return "electronicSign/electronicSignList_drafter";

	}

	// 소희 : 기안자가 올린 결재문서 중에서 대기중인 리스트 출력
	@ResponseBody
	@RequestMapping(value = "selectWaitList", produces = "application/json; charset=utf-8")
	public String selectWaitList(Model model,
			@RequestParam(value = "currentPage", required = false) Integer currentPage) {

		Member loginMember = (Member) model.getAttribute("loginMember");
		int memberNo = loginMember.getMemberNo();

		int listCount = elecService.getWaitListCount(memberNo);

		System.out.println(listCount);

		if (currentPage == null)
			currentPage = 1;

		PageInfo pInf = Pagination.getPageInfo(5, 10, currentPage, listCount);

		List<SignListView> waitList = elecService.selectWaitList(memberNo, pInf);
		System.out.println(waitList);

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("waitList", waitList);
		map.put("pInf", pInf);

		System.out.println("대기중 리스트 " + waitList);
		System.out.println("대기중 카운트 : " + pInf);

		System.out.println("map : " + map);

		return gson.toJson(map);
	}

	// 희원 심사중 목록
	@ResponseBody
	@RequestMapping(value = "selectProgressList", produces = "application/json; charset=utf-8")
	public String selectProgressList(Model model,
			@RequestParam(value = "currentPage", required = false) Integer currentPage) {

		Member loginMember = (Member) model.getAttribute("loginMember");
		int memberNo = loginMember.getMemberNo();

		int listCount = elecService.getProgressListCount(memberNo);

		if (currentPage == null)
			currentPage = 1;

		// 페이지 정보 저장
		PageInfo pInf = Pagination.getPageInfo(5, 10, currentPage, listCount);

		List<SignListView> waitList = elecService.selectProgressList(pInf, memberNo);

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("waitList", waitList);
		map.put("pInf", pInf);
		System.out.println("심사중 리스트 " + waitList);
		System.out.println("심사중 카운트 : " + pInf);

		return gson.toJson(map);

	}

	// 희원 반려 목록
	@ResponseBody
	@RequestMapping(value = "selectRejectList", produces = "application/json; charset=utf-8")
	public String selectRejectList(Model model,
			@RequestParam(value = "currentPage", required = false) Integer currentPage) {

		Member loginMember = (Member) model.getAttribute("loginMember");
		int memberNo = loginMember.getMemberNo();

		int listCount = elecService.getRejectListCount(memberNo);

		if (currentPage == null)
			currentPage = 1;

		// 페이지 정보 저장
		PageInfo pInf = Pagination.getPageInfo(5, 10, currentPage, listCount);

		List<SignListView> waitList = elecService.selectRejectList(pInf, memberNo);
		System.out.println("waitList : " + waitList);

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("waitList", waitList);
		map.put("pInf", pInf);

		return gson.toJson(map);

	}

	// 희원 결재완료 목록
	@ResponseBody
	@RequestMapping(value = "selectCompleteList", produces = "application/json; charset=utf-8")
	public String selectCompletList(Model model,
			@RequestParam(value = "currentPage", required = false) Integer currentPage) {

		Member loginMember = (Member) model.getAttribute("loginMember");
		int memberNo = loginMember.getMemberNo();

		int listCount = elecService.getCompletListCount(memberNo);

		if (currentPage == null)
			currentPage = 1;

		// 페이지 정보 저장
		PageInfo pInf = Pagination.getPageInfo(5, 10, currentPage, listCount);

		List<SignListView> waitList = elecService.selectCompletList(pInf, memberNo);

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("waitList", waitList);
		map.put("pInf", pInf);

		return gson.toJson(map);

	}

	// 소희 희원
	@RequestMapping("electronicSignList_payer")
	public String electronicSignList_payer(Model model,
			@RequestParam(value = "currentPage", required = false) Integer currentPage) {

		Member loginMember = (Member) model.getAttribute("loginMember");
		int memberNo = loginMember.getMemberNo();

		int listCount = elecService.getPayerListCount(memberNo);

		if (currentPage == null)
			currentPage = 1;

		// 페이지 정보 저장
		PageInfo pInf = Pagination.getPageInfo(5, 10, currentPage, listCount);

		List<SignTobeListView> allList = elecService.selectPayerList(pInf, memberNo);

		System.out.println("allList : " + allList);

		model.addAttribute("allList", allList);
		model.addAttribute("pInf", pInf);

		return "electronicSign/electronicSignList_payer";

	}

	// 소희(결재자가 결재 해야 할 문서 리스트)
	@ResponseBody
	@RequestMapping(value = "selectWaitTobeList", produces = "application/json; charset=utf-8")
	public String selectWaitTobeList(Model model,
			@RequestParam(value = "currentPage", required = false) Integer currentPage) {

		Member loginMember = (Member) model.getAttribute("loginMember");
		int memberNo = loginMember.getMemberNo();

		int listCount = elecService.getWaitTobeListCount(memberNo);

		if (currentPage == null)
			currentPage = 1;

		// 페이지 정보 저장
		PageInfo pInf = Pagination.getPageInfo(5, 10, currentPage, listCount);

		List<SignTobeListView> waitList = elecService.selectWaitTobeList(pInf, memberNo);
		System.out.println("waitTobeList 개수 : " + listCount);
		System.out.println("waitTobeList : " + waitList);

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("waitList", waitList);
		map.put("pInf", pInf);

		return gson.toJson(map);
	}

	//

	@RequestMapping("nightMealDraft") // 야근식대 전표 (폼) 작성 화면
	public String nightMealDraft() {
		return "electronicSign/nightMealDraft";
	}

//*******************************************************************************************************************************		
	@RequestMapping("insertNightMeal") // 원지
	public String insertNightMeal(Model model, HttpServletRequest request, RedirectAttributes rdAttr, String docTitle,
			String docContents, String docSignPath, String docRemark,
			@RequestParam(value = "docFile", required = false) List<MultipartFile> docFile) {

		Member loginMember = (Member) model.getAttribute("loginMember");
		String deptCode = loginMember.getDeptCode();
		System.out.println(deptCode);
		int memberNo = loginMember.getMemberNo();
		String deptNm = "";

		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/uploadFiles";
		File folder = new File(savePath);

		// System.out.println(docRemark);
		System.out.println("elecController - title : " + docTitle);
		System.out.println("elecController - contents : " + docContents);
		System.out.println("docSignPath" + docSignPath);

		if (!folder.exists())
			folder.mkdir();

		try {

			for (int i = 0; i < docFile.size(); i++) {
				System.out.println("docFile[" + i + "]" + docFile.get(i).getOriginalFilename());
			}

			List<Sgn_docFile> files = new ArrayList<Sgn_docFile>();
			Sgn_docFile df = null;

			for (MultipartFile mf : docFile) {

				if (!mf.getOriginalFilename().equals("")) {

					// 파일명 rename
					String changeFileName = FileRename.rename(mf.getOriginalFilename());

					// Sgn_docFile 객체 생성
					df = new Sgn_docFile(changeFileName, mf.getOriginalFilename(), savePath);

					// List<Sgn_docFile> files에 list 추가
					files.add(df);

				}
			}

			deptNm = deptBoardService.selectDept(deptCode); // 부서명 조회

			docContents.replace("\r\n", "<br>"); // 개행문자

			int result = elecService.insertNightMeal(memberNo, deptNm, docTitle, docContents, docSignPath, docRemark,
					files);

			if (result > 0) {

				for (Sgn_docFile file : files) {

					// 서버에 파일 저장
					for (MultipartFile mf : docFile) {
						// 빈문자열(파일이 없는 경우)가 아니면 실제 파일 정보를 저장하기 위해
						if (mf.getOriginalFilename().equals(file.getRealName())) {
							mf.transferTo(new File(file.getFilePath() + "/" + file.getFileName()));
							break;
						}
					}
				}

				rdAttr.addFlashAttribute("msg", "결재 등록이 완료되었습니다.");
				return "redirect:electronicSignList_drafter";
			} else {
				rdAttr.addFlashAttribute("msg", "전자 결재 등록이 실패되었습니다.");
				return "insertNightMeal";
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("errorMsg", "전자 결재 등록 오류");
		// System.out.println("컨트롤러 연결 ok");
		// System.out.println("deptNm : " + deptNm);
		return "common/errorPage";
	}

	/********************************************************************************************************************/

	@RequestMapping("expenseReportDraft") // 지출결의서 화면
	public String expenseReportDraft() {
		return "electronicSign/expenseReportDraft";
	}

	@RequestMapping("insertExpenseReport") // 원지
	public String insertExpenseReport(Model model, HttpServletRequest request, RedirectAttributes rdAttr,
			String docTitle, String docContents, String docSignPath, String docRemark,
			@RequestParam(value = "docFile", required = false) List<MultipartFile> docFile) {

		Member loginMember = (Member) model.getAttribute("loginMember");
		String deptCode = loginMember.getDeptCode();
		System.out.println(deptCode);
		int memberNo = loginMember.getMemberNo();
		String deptNm = "";

		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/uploadFiles";
		File folder = new File(savePath);

		// 지출결의서 금액 세자리단위의 콤마 삭제.
		String docRemarks = docRemark.replaceAll(",", "");
		System.out.println("docRemarks : " + docRemarks);

		if (!folder.exists())
			folder.mkdir();

		try {

			for (int i = 0; i < docFile.size(); i++) {
				System.out.println("docFile[" + i + "]" + docFile.get(i).getOriginalFilename());
			}

			List<Sgn_docFile> files = new ArrayList<Sgn_docFile>();
			Sgn_docFile df = null;

			for (MultipartFile mf : docFile) {

				if (!mf.getOriginalFilename().equals("")) {

					// 파일명 rename
					String changeFileName = FileRename.rename(mf.getOriginalFilename());

					// Sgn_docFile 객체 생성
					df = new Sgn_docFile(changeFileName, mf.getOriginalFilename(), savePath);

					// List<Sgn_docFile> files에 list 추가
					files.add(df);

				}
			}

			deptNm = deptBoardService.selectDept(deptCode); // 부서명 조회
			docContents.replace("\r\n", "<br>"); // 개행문자

			int result = elecService.insertExpenseReport(memberNo, deptNm, docTitle, docContents, docSignPath,
					docRemarks, files);

			if (result > 0) {

				for (Sgn_docFile file : files) {

					// 서버에 파일 저장
					for (MultipartFile mf : docFile) {
						// 빈문자열(파일이 없는 경우)가 아니면 실제 파일 정보를 저장하기 위해
						if (mf.getOriginalFilename().equals(file.getRealName())) {
							mf.transferTo(new File(file.getFilePath() + "/" + file.getFileName()));
							break;
						}
					}
				}

				rdAttr.addFlashAttribute("msg", "결재 등록이 완료되었습니다.");
				return "redirect:electronicSignList_drafter";
			} else {
				rdAttr.addFlashAttribute("msg", "전자 결재 등록이 실패되었습니다.");
				return "insertExpenseReport";
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("errorMsg", "전자 결재 등록 오류");
		// System.out.println("컨트롤러 연결 ok");
		// System.out.println("deptNm : " + deptNm);
		return "common/errorPage";

	}

	/********************************************************************************************************************/

	@RequestMapping("expenditureDraft") // 품의서 화면
	public String expenditureDraft() {
		return "electronicSign/expenditureDraft";
	}

	@RequestMapping("insertExpenditure") // 원지
	public String insertExpenditure(Model model, HttpServletRequest request, RedirectAttributes rdAttr, String docTitle,
			String docContents, String docSignPath,
			@RequestParam(value = "docFile", required = false) List<MultipartFile> docFile) {

		Member loginMember = (Member) model.getAttribute("loginMember");
		String deptCode = loginMember.getDeptCode();
		System.out.println(deptCode);
		int memberNo = loginMember.getMemberNo();
		String deptNm = "";

		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/uploadFiles";
		File folder = new File(savePath);

		if (!folder.exists())
			folder.mkdir();

		try {

			for (int i = 0; i < docFile.size(); i++) {
				System.out.println("docFile[" + i + "]" + docFile.get(i).getOriginalFilename());
			}

			List<Sgn_docFile> files = new ArrayList<Sgn_docFile>();
			Sgn_docFile df = null;

			for (MultipartFile mf : docFile) {

				if (!mf.getOriginalFilename().equals("")) {

					// 파일명 rename
					String changeFileName = FileRename.rename(mf.getOriginalFilename());

					// Sgn_docFile 객체 생성
					df = new Sgn_docFile(changeFileName, mf.getOriginalFilename(), savePath);

					// List<Sgn_docFile> files에 list 추가
					files.add(df);

				}
			}

			deptNm = deptBoardService.selectDept(deptCode); // 부서명 조회
			docContents.replace("\r\n", "<br>"); // 개행문자

			int result = elecService.insertExpenditure(memberNo, deptNm, docTitle, docContents, docSignPath, files);

			if (result > 0) {

				for (Sgn_docFile file : files) {

					// 서버에 파일 저장
					for (MultipartFile mf : docFile) {
						// 빈문자열(파일이 없는 경우)가 아니면 실제 파일 정보를 저장하기 위해
						if (mf.getOriginalFilename().equals(file.getRealName())) {
							mf.transferTo(new File(file.getFilePath() + "/" + file.getFileName()));
							break;
						}
					}
				}

				rdAttr.addFlashAttribute("msg", "결재 등록이 완료되었습니다.");
				return "redirect:electronicSignList_drafter";
			} else {
				rdAttr.addFlashAttribute("msg", "전자 결재 등록이 실패되었습니다.");
				return "insertExpenditure";
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("errorMsg", "전자 결재 등록 오류");
		// System.out.println("컨트롤러 연결 ok");
		// System.out.println("deptNm : " + deptNm);
		return "common/errorPage";
	}

	/********************************************************************************************************************/

	@RequestMapping("resignationDraft") // 사직서 작성 화면
	public String resignationDraft() {
		return "electronicSign/resignationDraft";
	}

	@RequestMapping("insertResignation") // 원지
	public String insertResignation(Model model, HttpServletRequest request, RedirectAttributes rdAttr, String docTitle,
			String docContents, String docSignPath, String docRemark,
			@RequestParam(value = "docFile", required = false) List<MultipartFile> docFile) {

		Member loginMember = (Member) model.getAttribute("loginMember");
		String deptCode = loginMember.getDeptCode();
		System.out.println(deptCode);
		int memberNo = loginMember.getMemberNo();
		String deptNm = "";

		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/uploadFiles";
		File folder = new File(savePath);

		if (!folder.exists())
			folder.mkdir();

		try {

			for (int i = 0; i < docFile.size(); i++) {
				System.out.println("docFile[" + i + "]" + docFile.get(i).getOriginalFilename());
			}

			List<Sgn_docFile> files = new ArrayList<Sgn_docFile>();
			Sgn_docFile df = null;

			for (MultipartFile mf : docFile) {

				if (!mf.getOriginalFilename().equals("")) {

					// 파일명 rename
					String changeFileName = FileRename.rename(mf.getOriginalFilename());

					// Sgn_docFile 객체 생성
					df = new Sgn_docFile(changeFileName, mf.getOriginalFilename(), savePath);

					// List<Sgn_docFile> files에 list 추가
					files.add(df);

				}
			}

			deptNm = deptBoardService.selectDept(deptCode); // 부서명 조회
			docContents.replace("\r\n", "<br>"); // 개행문자

			int result = elecService.insertResignation(memberNo, deptNm, docTitle, docContents, docSignPath, docRemark,
					files);

			if (result > 0) {

				for (Sgn_docFile file : files) {

					// 서버에 파일 저장
					for (MultipartFile mf : docFile) {
						// 빈문자열(파일이 없는 경우)가 아니면 실제 파일 정보를 저장하기 위해
						if (mf.getOriginalFilename().equals(file.getRealName())) {
							mf.transferTo(new File(file.getFilePath() + "/" + file.getFileName()));
							break;
						}
					}
				}

				rdAttr.addFlashAttribute("msg", "결재 등록이 완료되었습니다.");
				return "redirect:electronicSignList_drafter";
			} else {
				rdAttr.addFlashAttribute("msg", "전자 결재 등록이 실패되었습니다.");
				return "insertResignation";
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("errorMsg", "전자 결재 등록 오류");
		// System.out.println("컨트롤러 연결 ok");
		// System.out.println("deptNm : " + deptNm);
		return "common/errorPage";
	}

	/********************************************************************************************************************/

	@RequestMapping("physicalExamDraft") // 건강검진 작성 화면
	public String physicalExamDraft() {
		return "electronicSign/physicalExamDraft";
	}

	@RequestMapping("insertPhysicalExam") // 원지
	public String insertPhysicalExam(Model model, HttpServletRequest request, RedirectAttributes rdAttr,
			String docTitle, String docContents, String docSignPath, String docRemark,
			@RequestParam(value = "docFile", required = false) List<MultipartFile> docFile) {

		Member loginMember = (Member) model.getAttribute("loginMember");
		String deptCode = loginMember.getDeptCode();
		System.out.println(deptCode);
		int memberNo = loginMember.getMemberNo();
		String deptNm = "";

		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/uploadFiles";
		File folder = new File(savePath);

		if (!folder.exists())
			folder.mkdir();

		try {

			for (int i = 0; i < docFile.size(); i++) {
				System.out.println("docFile[" + i + "]" + docFile.get(i).getOriginalFilename());
			}

			List<Sgn_docFile> files = new ArrayList<Sgn_docFile>();
			Sgn_docFile df = null;

			for (MultipartFile mf : docFile) {

				if (!mf.getOriginalFilename().equals("")) {

					// 파일명 rename
					String changeFileName = FileRename.rename(mf.getOriginalFilename());

					// Sgn_docFile 객체 생성
					df = new Sgn_docFile(changeFileName, mf.getOriginalFilename(), savePath);

					// List<Sgn_docFile> files에 list 추가
					files.add(df);

				}
			}

			deptNm = deptBoardService.selectDept(deptCode); // 부서명 조회
			docContents.replace("\r\n", "<br>"); // 개행문자

			int result = elecService.insertPhysicalExam(memberNo, deptNm, docTitle, docContents, docSignPath, docRemark,
					files);

			if (result > 0) {

				for (Sgn_docFile file : files) {

					// 서버에 파일 저장
					for (MultipartFile mf : docFile) {
						// 빈문자열(파일이 없는 경우)가 아니면 실제 파일 정보를 저장하기 위해
						if (mf.getOriginalFilename().equals(file.getRealName())) {
							mf.transferTo(new File(file.getFilePath() + "/" + file.getFileName()));
							break;
						}
					}
				}

				rdAttr.addFlashAttribute("msg", "결재 등록이 완료되었습니다.");
				return "redirect:electronicSignList_drafter";
			} else {
				rdAttr.addFlashAttribute("msg", "전자 결재 등록이 실패되었습니다.");
				return "insertPhysicalExam";
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("errorMsg", "전자 결재 등록 오류");
		// System.out.println("컨트롤러 연결 ok");
		// System.out.println("deptNm : " + deptNm);
		return "common/errorPage";
	}

	/********************************************************************************************************************/

	@RequestMapping("holidayRequestDraft") // 휴가신청 작성 화면
	public String holidayRequestDraft() {
		return "electronicSign/holidayRequestDraft";
	}

	@RequestMapping("insertHolidayRequest") // 원지
	public String insertHolidayRequest(Model model, HttpServletRequest request, RedirectAttributes rdAttr,
			String docTitle, String docContents, String docSignPath, String docRemark,
			@RequestParam(value = "docFile", required = false) List<MultipartFile> docFile) {

		Member loginMember = (Member) model.getAttribute("loginMember");
		String deptCode = loginMember.getDeptCode();
		System.out.println(deptCode);
		int memberNo = loginMember.getMemberNo();
		String deptNm = "";

		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/uploadFiles";
		File folder = new File(savePath);

		if (!folder.exists())
			folder.mkdir();

		try {

			for (int i = 0; i < docFile.size(); i++) {
				System.out.println("docFile[" + i + "]" + docFile.get(i).getOriginalFilename());
			}

			List<Sgn_docFile> files = new ArrayList<Sgn_docFile>();
			Sgn_docFile df = null;

			for (MultipartFile mf : docFile) {

				if (!mf.getOriginalFilename().equals("")) {

					// 파일명 rename
					String changeFileName = FileRename.rename(mf.getOriginalFilename());

					// Sgn_docFile 객체 생성
					df = new Sgn_docFile(changeFileName, mf.getOriginalFilename(), savePath);

					// List<Sgn_docFile> files에 list 추가
					files.add(df);

				}
			}

			deptNm = deptBoardService.selectDept(deptCode); // 부서명 조회
			docContents.replace("\r\n", "<br>"); // 개행문자

			int result = elecService.insertHolidayRequest(memberNo, deptNm, docTitle, docContents, docSignPath,
					docRemark, files);

			if (result > 0) {

				for (Sgn_docFile file : files) {

					// 서버에 파일 저장
					for (MultipartFile mf : docFile) {
						// 빈문자열(파일이 없는 경우)가 아니면 실제 파일 정보를 저장하기 위해
						if (mf.getOriginalFilename().equals(file.getRealName())) {
							mf.transferTo(new File(file.getFilePath() + "/" + file.getFileName()));
							break;
						}
					}
				}

				rdAttr.addFlashAttribute("msg", "결재 등록이 완료되었습니다.");
				return "redirect:electronicSignList_drafter";
			} else {
				rdAttr.addFlashAttribute("msg", "전자 결재 등록이 실패되었습니다.");
				return "insertHolidayRequest";
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("errorMsg", "전자 결재 등록 오류");
		// System.out.println("컨트롤러 연결 ok");
		// System.out.println("deptNm : " + deptNm);
		return "common/errorPage";
	}

	/*
	 * @RequestMapping("absentDocReciever") public String absentDocReciever() {
	 * return "electronicSign/absentDocReciever"; }
	 */

	/********************************************************************************************************************/

	@RequestMapping("eventDraft") // 경조사 작성 화면
	public String eventDraft() {
		return "electronicSign/eventDraft";
	}

	@RequestMapping("insertEvent") // 원지
	public String insertEvent(Model model, HttpServletRequest request, RedirectAttributes rdAttr, String docTitle,
			String docContents, String docSignPath, String docRemark,
			@RequestParam(value = "docFile", required = false) List<MultipartFile> docFile) {

		Member loginMember = (Member) model.getAttribute("loginMember");
		String deptCode = loginMember.getDeptCode();
		System.out.println(deptCode);
		int memberNo = loginMember.getMemberNo();
		String deptNm = "";

		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/uploadFiles";
		File folder = new File(savePath);

		if (!folder.exists())
			folder.mkdir();

		try {

			for (int i = 0; i < docFile.size(); i++) {
				System.out.println("docFile[" + i + "]" + docFile.get(i).getOriginalFilename());
			}

			List<Sgn_docFile> files = new ArrayList<Sgn_docFile>();
			Sgn_docFile df = null;

			for (MultipartFile mf : docFile) {

				if (!mf.getOriginalFilename().equals("")) {

					// 파일명 rename
					String changeFileName = FileRename.rename(mf.getOriginalFilename());

					// Sgn_docFile 객체 생성
					df = new Sgn_docFile(changeFileName, mf.getOriginalFilename(), savePath);

					// List<Sgn_docFile> files에 list 추가
					files.add(df);

				}
			}

			deptNm = deptBoardService.selectDept(deptCode); // 부서명 조회
			docContents.replace("\r\n", "<br>"); // 개행문자

			int result = elecService.insertEvent(memberNo, deptNm, docTitle, docContents, docSignPath, docRemark,
					files);

			if (result > 0) {

				for (Sgn_docFile file : files) {

					// 서버에 파일 저장
					for (MultipartFile mf : docFile) {
						// 빈문자열(파일이 없는 경우)가 아니면 실제 파일 정보를 저장하기 위해
						if (mf.getOriginalFilename().equals(file.getRealName())) {
							mf.transferTo(new File(file.getFilePath() + "/" + file.getFileName()));
							break;
						}
					}
				}

				rdAttr.addFlashAttribute("msg", "결재 등록이 완료되었습니다.");
				return "redirect:electronicSignList_drafter";
			} else {
				rdAttr.addFlashAttribute("msg", "전자 결재 등록이 실패되었습니다.");
				return "insertEvent";
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("errorMsg", "전자 결재 등록 오류");
		// System.out.println("컨트롤러 연결 ok");
		// System.out.println("deptNm : " + deptNm);
		return "common/errorPage";
	}

	/********************************************************************************************************************/

	@RequestMapping("absentDocDraft") // 결근 사유서 작성 화면
	public String absentDocDraft() {
		return "electronicSign/absentDocDraft";
	}

	@RequestMapping("insertAbsentDoc") // 원지
	public String insertAbsentDoc(Model model, HttpServletRequest request, RedirectAttributes rdAttr, String docTitle,
			String docContents, String docSignPath, String docRemark,
			@RequestParam(value = "docFile", required = false) List<MultipartFile> docFile) {

		Member loginMember = (Member) model.getAttribute("loginMember");
		String deptCode = loginMember.getDeptCode();
		System.out.println(deptCode);
		int memberNo = loginMember.getMemberNo();
		String deptNm = "";

		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/uploadFiles";
		File folder = new File(savePath);

		if (!folder.exists())
			folder.mkdir();

		try {

			for (int i = 0; i < docFile.size(); i++) {
				System.out.println("docFile[" + i + "]" + docFile.get(i).getOriginalFilename());
			}

			List<Sgn_docFile> files = new ArrayList<Sgn_docFile>();
			Sgn_docFile df = null;

			for (MultipartFile mf : docFile) {

				if (!mf.getOriginalFilename().equals("")) {

					// 파일명 rename
					String changeFileName = FileRename.rename(mf.getOriginalFilename());

					// Sgn_docFile 객체 생성
					df = new Sgn_docFile(changeFileName, mf.getOriginalFilename(), savePath);

					// List<Sgn_docFile> files에 list 추가
					files.add(df);

				}
			}

			deptNm = deptBoardService.selectDept(deptCode); // 부서명 조회
			docContents.replace("\r\n", "<br>"); // 개행문자

			int result = elecService.insertAbsentDoc(memberNo, deptNm, docTitle, docContents, docSignPath, docRemark,
					files);

			if (result > 0) {

				for (Sgn_docFile file : files) {

					// 서버에 파일 저장
					for (MultipartFile mf : docFile) {
						// 빈문자열(파일이 없는 경우)가 아니면 실제 파일 정보를 저장하기 위해
						if (mf.getOriginalFilename().equals(file.getRealName())) {
							mf.transferTo(new File(file.getFilePath() + "/" + file.getFileName()));
							break;
						}
					}
				}
				System.out.println("docSignPath" + docSignPath);
				System.out.println("docRemark" + docRemark);

				rdAttr.addFlashAttribute("msg", "결재 등록이 완료되었습니다.");
				return "redirect:electronicSignList_drafter";

			} else {
				rdAttr.addFlashAttribute("msg", "전자 결재 등록이 실패되었습니다.");
				return "insertAbsentDoc";
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("errorMsg", "전자 결재 등록 오류");
		// System.out.println("컨트롤러 연결 ok");
		// System.out.println("deptNm : " + deptNm);
		return "common/errorPage";
	}

	/********************************************************************************************************************/

	@ResponseBody
	@RequestMapping(value = "msgSelectDepartment")
	public String msgSelectDepartment(String radioValue, Model model) {

		System.out.println("radiovalue=" + radioValue);

		List<Member> mList = null;
		Member loginMember = (Member) model.getAttribute("loginMember");
		int memberNo = loginMember.getMemberNo();

		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("radioValue", radioValue);
			map.put("memberNo", memberNo);

			mList = new ArrayList<Member>();
			mList = elecService.selectDepartment(map);
			if (!mList.isEmpty()) {
				System.out.println("출력성공" + mList);
			} else {
				System.out.println("출력실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return new Gson().toJson(mList);
	}

	/*****************************************************************************************/
	// detail 화면
	@RequestMapping(value = "sgnDocReceiver") // 결재자 화면 출력 나누기
	public String sgnDocReciever(ModelAndView mv, Model model, Integer no, RedirectAttributes rdAttr,
			HttpServletRequest request) {

		String beforeUrl = request.getHeader("referer");
		String url = "";
		try {

			System.out.println("detail 화면 위한 no : " + no);
			List<Sgn_doc> docList = elecService.selectDocList(no);

			if (docList != null) {

				List<Sgn_docFile> files = elecService.selectFiles(no);
				if (!files.isEmpty()) {
					for (int i = 0; i < files.size(); i++) {
						files.get(i);
						model.addAttribute("files", files);
					}
				}

				int dtNo = 0;

				for (Sgn_doc i : docList) {
					dtNo = i.getDtNo();
				}

				String docRemark = docList.get(0).getDocRemark();

				if (dtNo == 1) { // 야근식대 결재자 화면

					// ex) 김밥천국,2000
					if (docRemark != null) {
						int idx = docRemark.indexOf(",");
						docList.get(0).setStore(docRemark.substring(0, idx)); // 거래처명
						docList.get(0).setPrice(Integer.parseInt(docRemark.substring(idx + 1))); // 야식 금액

					}

					model.addAttribute("docList", docList);
					System.out.println(docList);
					url = "electronicSign/nightMealReicever";
				} else if (dtNo == 2) { // 지출결의서 결재자화면
					// docRemark = 화일..:7410:서류 보관용||펜설:960:모내미||
					// ----> 나중에 total들어올건지?

					model.addAttribute("docList", docList);
					System.out.println(docList);

					url = "electronicSign/expenseReportReciever";

				} else if (dtNo == 3) { // 품의서 결재자 화면 - 품의서는 비고 없음.

					model.addAttribute("docList", docList);
					System.out.println(docList);
					url = "electronicSign/expenditureReceiver";

				} else if (dtNo == 4) { // 사직서 결재자 화면
					// 입사일자,퇴사 예정일, 연락처, 주소
					// 2020-03-28,2020-03-31,010741801,74108520

					if (docRemark != null) {

						String[] splitRemark = docRemark.split(",");
						System.out.println(splitRemark);

						docList.get(0).setEnrollDate(splitRemark[0]);
						docList.get(0).setRetireDate(splitRemark[1]);
						docList.get(0).setSubPhone(splitRemark[2]); // 퇴직후 연락처
						docList.get(0).setSubAddress(splitRemark[3]); // 퇴직후 주소
					}

					model.addAttribute("docList", docList);
					System.out.println(docList);

					url = "electronicSign/resignationReceiver";
				} else if (dtNo == 5) { // 건강검진 결재자 화면
					// 연세이비인후과,난청,250000,80000

					String[] splitRemark = docRemark.split(",");

					docList.get(0).setHospital(splitRemark[0]); // 진료 기관명
					docList.get(0).setDisease(splitRemark[1]); // 병명

					int healthPrice = Integer.parseInt(splitRemark[2]);
					int copay = Integer.parseInt(splitRemark[3]);

					docList.get(0).setHealthPrice(healthPrice); // 신청금액
					docList.get(0).setCopay(copay); // 본인부담금

					model.addAttribute("docList", docList);
					System.out.println(docList);

					url = "electronicSign/physicalExamReciever";
				} else if (dtNo == 6) { // 휴가신청 결재자 화면
					String[] splitRemark = docRemark.split(",");
					docList.get(0).setHolidayStartDt(splitRemark[0]); // 휴가 시작일
					docList.get(0).setHolidayEndDt(splitRemark[1]); // 휴가 끝.
					docList.get(0).setHolidayType(splitRemark[2]); // 휴가 종류

					model.addAttribute("docList", docList);
					System.out.println(docList);

					url = "electronicSign/holidayRequestReciever";
				} else if (dtNo == 7) { // 경조신청 결재자 화면
					// 조의,본인,배우자,2020-03-28,2020-03-31,2020-04-10
					if (docRemark != null) {
						String[] splitRemark = docRemark.split(",");
						docList.get(0).setEventType(splitRemark[0]); // 경조 구분
						docList.get(0).setEventRelation(splitRemark[1]); // 본인과의 관계
						docList.get(0).setEventTarget(splitRemark[2]); // 대상자
						docList.get(0).setEventDate(splitRemark[3]); // 경조 일자
						docList.get(0).setEventBonus(splitRemark[4]); // 경조 지원금
						docList.get(0).setEventStartDt(splitRemark[5]); // 경조 시작일
						docList.get(0).setEventEndDt(splitRemark[6]); // 경조 종료일
					}
					model.addAttribute("docList", docList);
					System.out.println(docList);

					url = "electronicSign/eventReicever";
				} else { // 결근사유 결재자 화면

					String[] splitRemark = docRemark.split(",");
					docList.get(0).setAbsentStartDt(splitRemark[0]);
					docList.get(0).setAbsentEndDt(splitRemark[1]);

					model.addAttribute("docList", docList);
					System.out.println(docList);

					url = "electronicSign/absentDocReciever";
				}
			} else {
				rdAttr.addFlashAttribute("msg", "게시글 상세 조회 실패");
				return "redirect:" + beforeUrl;
			}

		} catch (Exception e) {
			e.printStackTrace();
			return "common/errorPage";
		}

		return url;
	}

	/*******************************************************************************************************/
	// 기안자 detail 화면
	@RequestMapping("sgnDocDrafter") // 결재자 화면 출력 나누기
	public String sgnDocDrafter(ModelAndView mv, Model model, @RequestParam(value = "no", required = false) Integer no,
			RedirectAttributes rdAttr, HttpServletRequest request) {

		String beforeUrl = request.getHeader("referer");
		String url = "";
		try {

			System.out.println("기안자 detail 화면 위한 no : " + no);
			List<Sgn_doc> docList = elecService.selectDocList(no);

			if (docList != null) {

				List<Sgn_docFile> files = elecService.selectFiles(no);
				if (!files.isEmpty()) {
					for (int i = 0; i < files.size(); i++) {
						files.get(i);
						model.addAttribute("files", files);
					}
				}

				int dtNo = 0;

				for (Sgn_doc i : docList) {
					dtNo = i.getDtNo();
				}

				String docRemark = docList.get(0).getDocRemark();

				if (dtNo == 1) { // 야근식대 결재자 화면

					// ex) 김밥천국,2000

					int idx = docRemark.indexOf(",");
					docList.get(0).setStore(docRemark.substring(0, idx)); // 거래처명
					docList.get(0).setPrice(Integer.parseInt(docRemark.substring(idx + 1))); // 야식 금액

					model.addAttribute("docList", docList);

					url = "electronicSign/nightMealDrafter";
				} else if (dtNo == 2) { // 지출결의서 결재자화면
					// docRemark = 화일..:7410:서류 보관용||펜설:960:모내미||
					// ----> 나중에 total들어올건지?

					model.addAttribute("docList", docList);

					url = "electronicSign/expenseReportDrafter";

				} else if (dtNo == 3) { // 품의서 기안자 화면
					if (docRemark != null) {
						// ex) 부가사항 || 지시사항
						// textarea입력이므로 차후 개행문자, 줄바꿈 처리
						System.out.println("제대로 갖고오냐 : " + docRemark);
						String[] splitRemark = docRemark.split("\\|\\|");
						docList.get(0).setAdditional(splitRemark[0]);
						docList.get(0).setOrder(splitRemark[1]);
						System.out.println("애디셔널 :" + docList.get(0).getAdditional());
						System.out.println("오더 : " + docList.get(0).getOrder());

					}
					model.addAttribute("docList", docList);
					url = "electronicSign/expenditureDrafter";
				} else if (dtNo == 4) { // 사직서 결재자 화면
					// 입사일자,퇴사 예정일, 연락처, 주소
					// 2020-03-28,2020-03-31,010741801,74108520

					String[] splitRemark = docRemark.split(",");

					docList.get(0).setEnrollDate(splitRemark[0]);
					docList.get(0).setRetireDate(splitRemark[1]);
					docList.get(0).setSubPhone(splitRemark[2]); // 퇴직후 연락처
					docList.get(0).setSubAddress(splitRemark[3]); // 퇴직후 주소

					model.addAttribute("docList", docList);
					url = "electronicSign/resignationDrafter";

				} else if (dtNo == 5) { // 건강검진 결재자 화면
					// 연세이비인후과,난청,250000,80000

					String[] splitRemark = docRemark.split(",");

					docList.get(0).setHospital(splitRemark[0]); // 진료 기관명
					docList.get(0).setDisease(splitRemark[1]); // 병명

					int healthPrice = Integer.parseInt(splitRemark[2]);
					int copay = Integer.parseInt(splitRemark[3]);

					docList.get(0).setHealthPrice(healthPrice); // 신청금액
					docList.get(0).setCopay(copay); // 본인부담금

					model.addAttribute("docList", docList);
					url = "electronicSign/physicalExamDrafter";

				} else if (dtNo == 6) { // 휴가신청 결재자 화면
					String[] splitRemark = docRemark.split(",");
					docList.get(0).setHolidayStartDt(splitRemark[0]); // 휴가 시작일
					docList.get(0).setHolidayEndDt(splitRemark[1]); // 휴가 끝.
					docList.get(0).setHolidayType(splitRemark[2]); // 휴가 종류

					model.addAttribute("docList", docList);
					url = "electronicSign/holidayRequestDrafter";
				} else if (dtNo == 7) { // 경조신청 결재자 화면
					// 조의,본인,배우자,2020-03-28,2020-03-31,2020-04-10
					if (docRemark != null) {
						String[] splitRemark = docRemark.split(",");
						docList.get(0).setEventType(splitRemark[0]); // 경조 구분
						docList.get(0).setEventRelation(splitRemark[1]); // 본인과의 관계
						docList.get(0).setEventTarget(splitRemark[2]); // 대상자
						docList.get(0).setEventDate(splitRemark[3]); // 경조 일자
						docList.get(0).setEventBonus(splitRemark[4]); // 경조 지원금
						docList.get(0).setEventStartDt(splitRemark[5]); // 경조 시작일
						docList.get(0).setEventEndDt(splitRemark[6]); // 경조 종료일
					}
					model.addAttribute("docList", docList);
					System.out.println(docList);

					url = "electronicSign/eventDrafter";
				} else { // 결근사유 결재자 화면

					String[] splitRemark = docRemark.split(",");
					docList.get(0).setAbsentStartDt(splitRemark[0]);
					docList.get(0).setAbsentEndDt(splitRemark[1]);

					model.addAttribute("docList", docList);
					url = "electronicSign/absentDocDrafter";
				}

			} else {
				rdAttr.addFlashAttribute("msg", "게시글 상세 조회 실패");
				return "redirect:" + beforeUrl;
			}

		} catch (Exception e) {
			e.printStackTrace();
			return "common/errorPage";
		}

		return url;
	}

	// ******************************************************************************************************
	// 결재하기
	@RequestMapping("updateSign")
	public String updateSign(int no, String dtNo, Model model, RedirectAttributes rdAttr,
			@RequestParam(value = "additional", required = false) String additional,
			@RequestParam(value = "order", required = false) String order) {

		String url = "";
		Member loginMember = (Member) model.getAttribute("loginMember");
		int memberNo = loginMember.getMemberNo();

		System.out.println("no : " + no);
		try {
			// 지시사항과 부가사항 컬럼에 넣기
			String docRemark = additional + "||" + order;

			Map<String, String> map = null;
			map = new HashMap<String, String>();
			map.put("memberNo", memberNo + "");
			map.put("no", no + "");
			map.put("dtNo", dtNo + "");
			map.put("docRemark", docRemark);

			System.out.println("map은 : " + map);
			int result = elecService.updateSign(map);
			System.out.println("Controller Result: " + result);

			if (result > 0) {
				rdAttr.addFlashAttribute("msg", "결재 승인처리가 완료되었습니다.");
				url = "redirect:/electronicSign/electronicSignList_payer";
			} else {
				rdAttr.addFlashAttribute("msg", "결재 승인처리가 실패되었습니다.");
				url = "redirect:/electronicSign/electronicSignList_payer";
			}

		} catch (Exception e) {
			e.printStackTrace();
			return "common/errorPage";
		}
		return url;
	}

	// ***************************************************************************************
	@ResponseBody
	@RequestMapping("expenditureReceiverChange")
	public int expenditureReceiverChange(int docNo, int docStep) {

		int result = 0;
		try {
			// SGN_SIGN 에서 카운트 해올거임
			result = elecService.stepCount(docNo);

			if (result == docStep) {
				// 결재단계가 마지막인 경우
				result = 0;
			} else {
				result = 1;
			}
		} catch (Exception e) {
			result = -1;
		}
		return result;
	}

	// ****************************************************************************************
	// 반려시작
	@RequestMapping("rejectSign")
	public String rejectSign(int no, Model model, RedirectAttributes rdAttr, String ssComment) {

		Member loginMember = (Member) model.getAttribute("loginMember");

		int memberNo = loginMember.getMemberNo();

		int result = 0;

		String url = "";

		try {
			Map<String, String> map = null;

			map = new HashMap<String, String>();

			// 회원번호, docNo, ssComment 넣고
			map.put("memberNo", memberNo + "");
			map.put("no", no + "");
			map.put("ssComment", ssComment);

			result = elecService.rejectSign(map);

			if (result > 0) {
				rdAttr.addFlashAttribute("msg", "결재 반려처리가 완료되었습니다.");
				url = "redirect:/electronicSign/electronicSignList_payer";
			} else {
				rdAttr.addFlashAttribute("msg", "결재 반려처리가 실패되었습니다.");
				url = "redirect:/electronicSign/electronicSignList_payer";
			}

		} catch (Exception e) {
			e.printStackTrace();
			return "common/errorPage";
		}

		return url;
	}

	// ***************************************************************************************************************
	// PDF 화면으로 전환
	@RequestMapping("signPDF")
	public String signPdf(String no, RedirectAttributes rdAttr, HttpServletRequest request, Model model) {

		String beforeUrl = request.getHeader("referer");

		Member loginMember = (Member)model.getAttribute("loginMember");
		
		String deptCode = "";
		String deptNm = "";
		
		int docNo = Integer.parseInt(no);
		String url = "";
		try {

			int dtNo = elecService.selectDtNo(docNo);

			List<Sgn_doc> docList = elecService.selectDocList(docNo);

			String docRemark = docList.get(0).getDocRemark();
			
			System.out.println("리스트 사이즈 : " + docList.size()); 
			int lastSignImageIndex = docList.size()-1; 
			

			if (dtNo == 1) { // 야근식대
				url = "electronicSign/nightMealPDF";

			} else if (dtNo == 2) { // 지출결의서
				url = "electronicSign/expenseReportPDF";

			} else if (dtNo == 3) { // 품의서
				if (docRemark != null) {
					// ex) 부가사항 || 지시사항
					// textarea입력이므로 차후 개행문자, 줄바꿈 처리
					System.out.println("제대로 갖고오냐 : " + docRemark);
					String[] splitRemark = docRemark.split("\\|\\|");
					docList.get(0).setAdditional(splitRemark[0]);
					docList.get(0).setOrder(splitRemark[1]);
					System.out.println("애디셔널 :" + docList.get(0).getAdditional());
					System.out.println("오더 : " + docList.get(0).getOrder());
					
					
					
					deptCode = loginMember.getDeptCode();
					deptNm = deptBoardService.selectDept(deptCode); // 부서명 조회 
					

				}
				model.addAttribute("lastSignImageIndex", lastSignImageIndex);
				model.addAttribute("docList", docList);
				model.addAttribute("deptNm", deptNm);

				url = "electronicSign/expenditurePDF";

			} else if (dtNo == 4) { // 사직서
				url = "electronicSign/resignationPDF";

			} else if (dtNo == 5) { // 건강
				url = "electronicSign/physicalExamPDF";

			} else if (dtNo == 6) { // 휴가
				url = "electronicSign/holidayRequestPDF";

			} else if (dtNo == 7) { // 경조
				url = "electronicSign/eventPDF";

			} else { // 결근
				url = "electronicSign/absentDocPDF";
			}

		} catch (Exception e) {
			e.printStackTrace();
			return "common/errorPage";
		}
		return url;
	}

}
