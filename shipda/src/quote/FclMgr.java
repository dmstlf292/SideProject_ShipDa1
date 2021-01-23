package quote;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class FclMgr {
	
	private DBConnectionMgr pool;
	
	public FclMgr() {
		pool=DBConnectionMgr.getInstance();
	}
	
	public void insertFcl(FclBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "insert fcl(departure,country,adrress,transit,arrive,acountry,aAdrress,incoterms,item,";
			sql += "ctype,csize,volume,danger,lss,surcharge,extra,entry,client,ref,pos,depth,regdate,pass,count)";
			sql += "values(?,?,?,?,?,?,?,?,?,?,?,   0, ?,?,?,?,?,?,   ?,0,0,now(),?,0)";		
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getDeparture());
			pstmt.setString(2, bean.getCountry());
			pstmt.setString(3, bean.getAdrress());
			pstmt.setString(4, bean.getTransit());
			
			pstmt.setString(5, bean.getArrive());
			pstmt.setString(6, bean.getAcountry());
			pstmt.setString(7, bean.getaAdrress());
			/////////////////////////////////////////
			String clists[]= {"CFR","CIF","CIP","CPT","DAP","DDP","EXW","FCA","FOB"};
			String incoterms[]=bean.getIncoterms();
			char ic[]= {'0','0','0','0','0','0','0','0','0'};
			for(int i=0; i<incoterms.length;i++) {
				for(int j=0; j<clists.length;j++) {
					if(incoterms[i].equals(clists[j])) {
						ic[j]='1';
						break;
					}
				}
			}
			pstmt.setString(8, new String(ic));
			//////////////////////////////////////////
			pstmt.setString(9, bean.getItem());
			///////////////////////////////////////
			String tlists[]= {"DRY","REEFER","OPEN TOP","FLAT RACK"};
			String ctype[]=bean.getCtype();
			char ct[]= {'0','0','0','0','0'};
			for(int i=0; i<ctype.length;i++) {
				for(int j=0; j<tlists.length;j++) {
					if(tlists[i].equals(tlists[j])) {
						ct[j]='1';
						break;
					}
				}
			}
			pstmt.setString(10, new String(ct));
			/////////////////////////////////////////
			String clist[]= {"20DRY","40DRY","40HQ"};
			String csize[]=bean.getCsize();
			char cs[]= {'0','0','0'};
			for(int i=0; i<csize.length;i++) {
				for(int j=0; j<clist.length;j++) {
					if(clist[i].equals(clist[j])) {
						cs[j]='1';
						break;
					}
				}
			}
			pstmt.setString(11, new String());
			////////////////////////////////////////////
			pstmt.setInt(12, bean.getVolume());
			/////////////////////////////////////////////
			String dlists[]= {"NO(NORMAL)","YES"};
			String danger[]=bean.getDanger();
			char dg[]= {'0','0'};
			for(int i=0; i<danger.length;i++) {
				for(int j=0; j<dlists.length;j++) {
					if(dlists[i].equals(dlists[j])) {
						dg[j]='1';
						break;
					}
				}
			}
			pstmt.setString(13, new String(dg));
			///////////////////////////////////////////
			String lssLists[]= {"Include","Not Include"};
			String lss[]=bean.getLss();
			char ls[]= {'0','0'};
			for(int i=0; i<lss.length;i++) {
				for(int j=0; j<lssLists.length;j++) {
					if(lssLists[i].equals(lssLists[j])) {
						ls[j]='1';
						break;
					}
				}
			}
			pstmt.setString(14, new String(ls));
			////////////////////////////////////////
			String sLists[]= {"Include","Not Include"};
			String surcharge[]=bean.getSurcharge();
			char sc[]= {'0','0'};
			for(int i=0; i<surcharge.length;i++) {
				for(int j=0; j<sLists.length;j++) {
					if(sLists[i].equals(sLists[j])) {
						ls[j]='1';
						break;
					}
				}
			}
			pstmt.setString(15, new String(sc));
			//////////////////////////////////////
			String eLists[]= {"Include","Not Include"};
			String extra[]=bean.getExtra();
			char ex[]= {'0','0'};
			for(int i=0; i<extra.length;i++) {
				for(int j=0; j<eLists.length;j++) {
					if(eLists[i].equals(eLists[j])) {
						ex[j]='1';
						break;
					}
				}
			}
			pstmt.setString(16, new String(ex));
			/////////////////////////////////////////
			String pLists[]= {"Possible","Not Possible"};
			String entry[]=bean.getEntry();
			char et[]= {'0','0'};
			for(int i=0; i<entry.length;i++) {
				for(int j=0; j<pLists.length;j++) {
					if(pLists[i].equals(pLists[j])) {
						et[j]='1';
						break;
					}
				}
			}
			pstmt.setString(17, new String(et));
			/////////////////////////////////////
			pstmt.setString(18, bean.getClient());
			
			pstmt.setInt(19, bean.getRef());
			pstmt.setInt(20, bean.getPos());
			pstmt.setInt(21, bean.getDepth());
			pstmt.setString(22, bean.getRegdate());
			pstmt.setString(23, bean.getPass());
			pstmt.setInt(24, bean.getCount());
			int cnt = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return;
	}
	
	
	public void post100() {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "insert fcl(departure,country,adrress,transit,arrive,acountry,aAdrress,incoterms,item,";
			sql += "ctype,csize,volume,danger,lss,surcharge,extra,entry,client,      ref,pos,depth,regdate,pass,count)";
			sql += "values('aaa','aaa','aaa','aaa','aaa','aaa','aaa','aaa','aaa','aaa','aaa',   0, 'aaa','aaa','aaa','aaa','aaa','aaa',       0,0,0,now(),'aaa',0)";		
			pstmt = con.prepareStatement(sql);
			for (int i = 0; i < 100; i++) {
				pstmt.executeUpdate();
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return;
	}
	
	public static void main(String[] args) {
		FclMgr mgr = new FclMgr();
		mgr.post100();
	}
	
	
}
