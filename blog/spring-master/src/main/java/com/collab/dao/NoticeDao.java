package com.collab.dao;

import com.collab.dto.NoticeDto;
import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class NoticeDao  extends EgovAbstractMapper{
    //공지글 작성
    public int insertNoticeInfo(NoticeDto noticeDto) throws Exception{
        return insert("notice.saveNotice", noticeDto);
    }

    //공지글 리스트
    public List<NoticeDto> noticeList() throws Exception{
        List<NoticeDto> noticeList = selectList("notice.getNoticeList");
        return noticeList;
    }

    //공지글 상세
    public NoticeDto selectNoticeDetail(int noticeId)throws Exception{
        return selectOne("notice.getNoticeDetail",noticeId);
    }

    //공지글 게시글 조회수
    public int increaseNoticeViewCnt(int noticeId) throws Exception{
        return update("notice.increaseNoticeViewCnt", noticeId);
    }
}
