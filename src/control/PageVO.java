package control;

/**
 * @author YangYZ
 *
 * 2011-11-30
 */
public class PageVO {

	/**
	 * ÿҳ��ʾ������,Ĭ��Ϊ10
	 */
	private int rownumperpage=25;   

	/**
	 * Ŀǰ����һҳ Ĭ��Ϊ��һҳ
	 */
	private int currentPage=1;

	/**
	 * ������
	 */
	private int totalRownum;

	/**
	 * ��ҳ��
	 */
	private int pageNums;

	/**
	 * ҳ����ʾ�ĵ�һҳ(�µķ�ҳ�������) ҳ����Ҫ��ʾ���ҳ����
	 */
	private int startPage = 1;

	/**
	 * ҳ����ʾ�ķ�ҳ������ҳ��
	 */
	private int endPage = 1;
	
	/**
	 * startPage - endPage �ľ��� ���㷭ҳʱ����
	 */
	private int pageStep = 5;
	
	/**
	 * ��ȡ��ҳ��
	 * 
	 */
	public int getPageNums() {
		return pageNums;
	}

	public int getTotalRownum() {
		return totalRownum;

	}

	public void setTotalRownum(int totalRownum) {
		
		this.totalRownum = totalRownum;

		calcPages();
	}

	public int getCurrentPage() {
		
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		if (currentPage <= 0) {
			this.currentPage = 1;
		} else {
			this.currentPage = currentPage;
		}
	}

	/**
	 * ������ҳ��
	 * 
	 */
	//TODO ����������˳�򣬲��ã�
	private void calcPages() {
		if (totalRownum <= 0) {
			totalRownum = 0;
			pageNums = 0;
			currentPage = 1;
			return;
		}
		
		if (totalRownum % rownumperpage == 0) {
			pageNums = totalRownum / rownumperpage;  //pageNums ��ҳ��
		} else {
			pageNums = totalRownum / rownumperpage + 1;
		}
		
		if (currentPage > pageNums) {
			currentPage = 1;
		}
		if (pageNums <= pageStep) {
			startPage = 1;
		} else {
			startPage = currentPage - (pageStep / 2);      // 7-(5/2)=2
			if (startPage<=0) {
				startPage = 1;
			}
		}
		endPage = startPage + pageStep - 1;
		if (endPage > pageNums) {
			endPage = pageNums;
		}
	}

	public int getStartPage() {
		return startPage;
	}

	public int getRownumperpage() {
		return rownumperpage;
	}

	public PageVO setRownumperpage(int rownumperpage) {
		this.rownumperpage = rownumperpage;
		
		return this;
	}

	/**
	 * ��ȡ��ǰҳ�ĵ�һ����¼��λ��
	 * 
	 */
	public int getFirstResult() {
		return (currentPage - 1) * rownumperpage;    // (1-1)x10=0�������һ���±�0��  (2-1)x10=10�������11���±�10��   
	}
	
	public void setCurrentResult(int cur) {
		int k = cur / rownumperpage + 1;
		this.setCurrentPage(k);
	}

	public int getEndPage() {
		return endPage;
	}

	public void setPageStep(int pageStep) {
		if ((pageStep < 10) && (pageStep > 1)) {
			this.pageStep = pageStep;
		}
	}

	
	
}
