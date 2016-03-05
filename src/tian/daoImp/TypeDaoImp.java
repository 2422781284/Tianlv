package tian.daoImp;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tian.base.BaseDaoImpl;
import tian.dao.ItemDao;
import tian.dao.TypeDao;
import tian.table.Type;

/**
 * Created by liutao on 2015/9/1.
 */

@Service
@Transactional
public class TypeDaoImp extends BaseDaoImpl<Type> implements TypeDao {
}
