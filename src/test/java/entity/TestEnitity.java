package entity;

import java.sql.SQLException;
import java.util.List;

import com.goncharov.secure.dao.Factory;
import com.goncharov.secure.entity.User;
import com.goncharov.secure.entity.interfaces.BaseID;

public class TestEnitity {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("Start");
		try {
			User oneUser = Factory.getInstance().getLoginDAO().getByLogin("alexwolf");
//			List<BaseID> allList = Factory.getInstance().getBaseDao().getAll();
			
			System.out.println(oneUser.toString());
//			oneUser.setBaseIdSet(allList);
			
//			Factory.getInstance().getLoginDAO().update(oneUser);
			BaseID ll = new BaseID();
			ll.getBaseID();
			List<User> allList  = Factory.getInstance().getLoginDAO().getAll();
			System.out.println(allList.size());
			for (User base : allList){
				
				System.out.println(base.toString());
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
