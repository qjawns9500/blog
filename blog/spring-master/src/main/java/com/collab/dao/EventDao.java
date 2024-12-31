package com.collab.dao;

import com.collab.dto.EventDto;
import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class EventDao extends EgovAbstractMapper{

    //이벤트 상세
    public EventDto selectEventDetail(int eventId)throws Exception{
        return selectOne("event.getEventDetail",eventId);
    }

    //이벤트 작성
    public int insertEventInfo(EventDto eventDto) throws Exception{
        return insert("event.saveEvent", eventDto);
    }

    //이벤트 리스트
    public List<EventDto> eventList()throws Exception{
        return selectList("event.getEventList");
    }


    //이벤트 게시글 조회수 증가
    public int increaseEventViewCnt(int eventId) throws Exception{
        return update("event.increaseEventViewCnt", eventId);
    }

}
