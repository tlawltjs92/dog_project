package action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Search_Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ParseException {
		ActionForward forward = new ActionForward();
		
		String upr_cd = request.getParameter("upr_cd");
		String org_cd = request.getParameter("org_cd");
		String care = request.getParameter("care");
		String care_reg_no = request.getParameter("care_reg_no");
		String state = request.getParameter("state");
		String bgnde = request.getParameter("bgnde");
		String endde = request.getParameter("endde");
		String upkind = request.getParameter("upkind");
		String kind = request.getParameter("kind");
		String neuter_yn = request.getParameter("neuter_yn");

		/*
		 * SimpleDateFormat bgnde_date = new SimpleDateFormat("yyyy-MM-dd"); try { Date
		 * date = bgnde_date.parse(bgnde); System.out.println(date); } catch
		 * (ParseException e) { // TODO Auto-generated catch block e.printStackTrace();
		 * }
		 * 
		 * System.out.println(bgnde);
		 */
		/*
		 * try { Date bgnde_date = new SimpleDateFormat("yyyyMMdd").parse(bgnde); }
		 * catch (ParseException e) { // TODO Auto-generated catch block
		 * e.printStackTrace(); }
		 */
		
		//Date result_bgnde = new java.text.SimpleDateFormat("yyyy-MM-dd").parse(bgnde);

		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
		Date before_bgnde = fm.parse(bgnde);
		Date before_endde = fm.parse(endde);
		SimpleDateFormat after_bgnde = new SimpleDateFormat("yyyyMMdd");
		SimpleDateFormat after_endde = new SimpleDateFormat("yyyyMMdd");
		bgnde = after_bgnde.format(before_bgnde);
		endde = after_endde.format(before_endde);
		
		if(upr_cd == null) {
			upr_cd = "";
		} else if(org_cd == null) {
			org_cd = "";
		} else if(care == null) {
			care = "";
		} else if(care_reg_no == null) {
			care_reg_no = "";
		} else if(state == null) {
			state = "";
		} else if(bgnde == null) {
			bgnde = "";
		} else if(endde == null) {
			endde = "";
		} else if(upkind == null) {
			upkind = "";
		} else if(kind == null) {
			kind = "";
		} else if(neuter_yn == null) {
			neuter_yn = "";
		}
		
		request.setAttribute("upr_cd", upr_cd);
		request.setAttribute("org_cd", org_cd);
		request.setAttribute("care", care);
		request.setAttribute("care_reg_no", care_reg_no);
		request.setAttribute("state", state);
		request.setAttribute("bgnde", bgnde);
		request.setAttribute("endde", endde);
		request.setAttribute("upkind", upkind);
		request.setAttribute("kind", kind);
		request.setAttribute("neuter_yn", neuter_yn);
		
		forward.setPath("list.do");
		
		return forward;
	}

}
