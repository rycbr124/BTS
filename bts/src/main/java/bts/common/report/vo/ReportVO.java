package bts.common.report.vo;

import java.sql.Timestamp;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component("reportVO")
@Scope("prototype")
public class ReportVO {
	private int report_no;
	private Timestamp report_date;
	private String title;
	private String report_se;
	private String contents;
	private String pnish_cd;
	private String member_id;
	private String report_at;
	private String contents_cd;
	
	public String getContents_cd() {
		return contents_cd;
	}
	public void setContents_cd(String contents_cd) {
		this.contents_cd = contents_cd;
	}
	public int getReport_no() {
		return report_no;
	}
	public void setReport_no(int report_no) {
		this.report_no = report_no;
	}
	public Timestamp getReport_date() {
		return report_date;
	}
	public void setReport_date(Timestamp report_date) {
		this.report_date = report_date;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getReport_se() {
		return report_se;
	}
	public void setReport_se(String report_se) {
		this.report_se = report_se;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getPnish_cd() {
		return pnish_cd;
	}
	public void setPnish_cd(String pnish_cd) {
		this.pnish_cd = pnish_cd;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getReport_at() {
		return report_at;
	}
	public void setReport_at(String report_at) {
		this.report_at = report_at;
	}
	
	
}
