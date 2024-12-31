package com.collab.service;

import com.collab.dao.MeetingDao;
import com.collab.dao.NoticeDao;
import com.collab.dto.NoticeDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoticeService {
    @Autowired
    private NoticeDao noticeDao;

    //공지글 저장
    public void saveNotice(NoticeDto noticeDto){
        try {
            noticeDao.insertNoticeInfo(noticeDto);

        }catch (Exception e){
            throw new RuntimeException(e);
        }
    }

    //공지글 리스트
    public List<NoticeDto> listNotice()throws Exception{
        List<NoticeDto> notices = noticeDao.noticeList();
        return notices;
    }

    //공지글 상세
    public NoticeDto getNoticeDetail(int noticeId)throws Exception{
        NoticeDto noticeDetail = noticeDao.selectNoticeDetail(noticeId);
        return noticeDetail;
    }

    //공지글 조회수 증가
    public int increaseNoticePostViewcnt(int noticeId) throws Exception{
        return noticeDao.increaseNoticeViewCnt(noticeId);
    }
}
