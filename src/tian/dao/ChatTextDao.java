package tian.dao;

import tian.base.BaseDao;
import tian.table.ChatText;

import java.util.List;

/**
 * Created by liutao on 2015/9/16.
 */
public interface ChatTextDao extends BaseDao<ChatText> {
    List<ChatText> findByRandS(Long sendId,Long receId);
    List<Object[]> findByR(Long receId);
}
