package com.collab.dao;

import com.collab.dto.*;
import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MeetingDao extends EgovAbstractMapper {

    //모임 저장
    public int insertMeetingInfo(MeetingDto meetingDto) throws Exception{
        return insert("main.saveMeetting", meetingDto);
    }

    //모임 게시글 조회수 증가
    public int increaseMeetingViewCnt(int regId) throws Exception{
        return update("main.increaseMeetingViewCnt", regId);
    }


    //모임 목록
    public List<MeetingDto> getMeettingList() throws Exception{
        List<MeetingDto> list = selectList("main.getMettingList");
        return list;
    }

    //모임 상세
    public MeetingDto selectMeetingDetail(int regId)throws Exception{
        return selectOne("main.getMeetingDetail",regId);
    }



    //좋아요등록
    public int insertLikes(LikesDto likesDto) throws Exception{
        return insert("main.insertLikes", likesDto.getRegId());
    }

    //좋아요 찾기
    public int findMyLikes(LikesDto likesDto) throws Exception{
        return selectOne("main.checkMyLikes",likesDto.getRegId());
    }

    //좋아요 삭제
    public int deleteLikes(int regId) throws Exception{
        return delete("main.deleteLikes",regId);
    }

    //좋아요 리스트
    public List<MeetingDto> getLikesList()throws Exception{
        List<MeetingDto> likesList = selectList("main.myLikesList");
        return likesList;
    }


    //"해시태그 종류" 삽입
    public int insertHashtagTypes(List<String> hashtags)throws Exception{
        return insert("main.insertHashtagType",hashtags);
    }

    //"해시태그", 게시글Id값 삽입
    public int insertHashtag(MeetingDto meetingDto)throws Exception{
        return insert("main.insertHashtag",meetingDto);
    }

    //해시태그 불러오기
    public List<HashtagDto> selectHashtag() throws Exception{
           List<HashtagDto> list = selectList("main.selectHashtag");
        return list;
    }

    //해시태그 종류 중복체크
    public List<String> checkDuplicateHashtagType(MeetingDto meetingDto)throws Exception{
        List<String> list = selectList("main.checkDuplicateHashtagType",meetingDto);
        return list;
    }


    //해시태그 누적 랭킹 조회
    public List<RankingDto> selectToalRanking()throws Exception{
        List<RankingDto> totalrankList = selectList("main.selectToalRanking");
        return totalrankList;
    }

    //해시태그 주간 랭킹 조회
    public List<RankingDto> selectWeeklyranking()throws Exception{
        List<RankingDto> weeklyrankList = selectList("main.selectWeeklyranking");
        return weeklyrankList;
    }

    //해시태그  주간 랭킹 삽입
    public int insertWeeklyranking()throws Exception{
        return insert("main.insertWeeklyranking");
    }

    //해시태그 연관 게시글 보여주기
    public List<MeetingDto> selectRelatedPosts(int tagtypeId) throws Exception{
        List<MeetingDto> relatedPosts = selectList("main.selectRelatedPosts",tagtypeId);
        return relatedPosts;
    }

}
