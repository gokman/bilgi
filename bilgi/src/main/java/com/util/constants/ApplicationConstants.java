package com.util.constants;

public interface ApplicationConstants {

	public static final int imageCountPerObject = 3;
	
	public static interface MEMBERSHIP_STATUS_CODES {
		public static final String ACTIVE 	= "Aktif";
		public static final String WAITING 	= "Bekliyor";
		public static final String PASIVE	= "Pasif";
	}
	
	public static interface EntityImageTypes {
		public static final String CUSTOMER ="C";
		public static final String PRODUCT  ="P";
	}
	
	public static interface EntityImageTypePath{
		public static final String CUSTOMER ="customer";
		public static final String PRODUCT  ="product";
	}
}
