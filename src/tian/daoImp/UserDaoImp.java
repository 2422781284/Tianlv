package tian.daoImp;


import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tian.base.BaseDaoImpl;
import tian.dao.UserDao;
import tian.table.User;

import java.util.List;

/**
 * Created by liutao on 2015/9/1.
 */
@Service
@Transactional
public class UserDaoImp extends BaseDaoImpl<User> implements UserDao {
    @Override
    public List<User> findByName(String name) {
        return getSession().createQuery("from User as user where user.name=?").setString(0, name).list();
    }
}
