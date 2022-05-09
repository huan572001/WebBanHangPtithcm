package ptithcm.entity;

public class TurnoverStaff {
	private String staffId;
	private String staffName;
	private Float turnover;
	private Float profit;
	public String getStaffName() {
		return staffName;
	}
	public void setStaffName(String staffName) {
		this.staffName = staffName;
	}
	public Float getTurnover() {
		return turnover;
	}
	public void setTurnover(Float turnover) {
		this.turnover = turnover;
	}
	public Float getProfit() {
		return profit;
	}
	public void setProfit(Float profit) {
		this.profit = profit;
	}
	public String getStaffId() {
		return staffId;
	}
	public void setStaffId(String staffId) {
		this.staffId = staffId;
	}
}
