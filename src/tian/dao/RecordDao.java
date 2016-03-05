package tian.dao;

import tian.base.BaseDao;
import tian.table.Record;

import java.util.List;

/**
 * Created by liutao on 2015/9/10.
 */
public interface RecordDao extends BaseDao<Record>{
   Object findStarAndCount(Long itemId);
   List<Object> findComment(Long itemId);
   List<Object[]> findByUserIdCert(Long userId);
   List<Object[]> findByUserIdPaid(Long userId);
   Object findRec(Long id);
   List<Object[]> findMyHandOut(Long userId);
   List<Object> findByItemId(Long itemId);
}
