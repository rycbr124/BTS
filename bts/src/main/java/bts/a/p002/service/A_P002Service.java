package bts.a.p002.service;

import java.util.List;
import java.util.Map;

import bts.common.report.vo.PnishVO;

public interface A_P002Service {

	List<PnishVO> selectPnishList(String p_name);

	void savePnishList(Map<String, String[]> dataMap);

}
