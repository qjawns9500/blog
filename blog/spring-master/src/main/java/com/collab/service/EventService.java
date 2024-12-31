package com.collab.service;

import com.collab.dao.EventDao;
import com.collab.dto.EventDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EventService {

    @Autowired
    private EventDao eventDao;


    //이벤트 상세
    public EventDto getEventDetail(int eventId) throws  Exception{
        EventDto eventDetail = eventDao.selectEventDetail(eventId);
        return eventDetail;
    }


    //이벤트 저장
    public void saveEvent(EventDto eventDto){
        try {
            eventDao.insertEventInfo(eventDto);
        }catch (Exception e){
            throw new RuntimeException(e);
        }
    }

    //이벤트 리스트
    public List<EventDto> listEvent() throws  Exception{
        return eventDao.eventList();
    }

    //이벤트 게시글 조회수 증가
    public int increaseEventPostViewcnt(int eventId) throws Exception{
        return eventDao.increaseEventViewCnt(eventId);
    }





}
