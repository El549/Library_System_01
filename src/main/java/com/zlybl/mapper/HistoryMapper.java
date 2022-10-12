package com.zlybl.mapper;

import com.zlybl.pojo.History;

import java.util.List;

public interface HistoryMapper {
    //全查借书记录
    List<History> selectAllHistory();

    //根据条件查询多条图书记录
    List<History> selectHistorysByConditions(History history);

    //根据id查询单条图书记录
    public History selectHistoryByHistoryId(int historyId);

    //增加借书记录
    int addHistory(History history);

    //修改借书记录
    int updateHistory(History history);

    //删除借书记录
    int deleteHistory(int historyId);
}
