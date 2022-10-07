package com.zlybl.mapper;

import com.zlybl.pojo.History;

import java.util.List;

public interface HistoryMapper {
    //全查借书记录
    public List<History> selectAllHistory();

    //根据条件查询多条图书记录
    public List<History> selectHistorysByConditions(History history);

    //根据条件查询单条图书记录
    public History selectHistoryByConditions(History history);

    //增加借书记录
    public int addHistory(History history);

    //修改借书记录
    public int updateHistory(History history);

    //删除借书记录
    public int deleteHistory(int historyId);
}
