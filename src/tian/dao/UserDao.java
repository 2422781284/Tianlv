package tian.dao;

import tian.base.BaseDao;
import tian.table.User;

import java.util.List;

/**
 * Created by liutao on 2015/9/1.
 */
public interface UserDao extends BaseDao<User> {
    List<User> findByName(String name);

}
