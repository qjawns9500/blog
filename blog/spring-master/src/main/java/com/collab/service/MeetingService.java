package com.collab.service;

import com.collab.dao.MeetingDao;
import com.collab.dto.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
public class MeetingService {
    @Autowired
    private MeetingDao meetingDao;

    //모임 저장
    public void saveMeeting(MeetingDto meetingDto) {
        try {
            if((meetingDto.getHashtag() == null) ||( meetingDto.getHashtag().isEmpty())){
                //해시태그가 없는 게시글인 경우
                meetingDao.insertMeetingInfo(meetingDto);
            }else{
                //해시태그가 있는 게시글인 경우
                meetingDao.insertMeetingInfo(meetingDto); //게시글 저장


                //중복 해시태그가 없는 경우
                if(meetingDao.checkDuplicateHashtagType(meetingDto).isEmpty()){

                // 중복 해시태그가 없는 경우 데이터 삽입
                meetingDao.insertHashtagTypes(meetingDto.getHashtag()); // "해시태그타입 테이블"에 해시태그 등록 insert
                meetingDao.insertHashtag(meetingDto);    // "해시태그"테이블에 게시글Id값, 해시태그 타입Id insert


                //중복 해시태그가 있는 경우
                }else if(!(meetingDao.checkDuplicateHashtagType(meetingDto).isEmpty())){

                    //중복된 해시태그들 목록을 가져오는 리스트
                    List<String> checkResult = meetingDao.checkDuplicateHashtagType(meetingDto);

                    //중복을 확인하는 SET
                    Set<String> checkSet = new HashSet<>(checkResult);

                    //입력받은 원본해시태그
                    List<String> tempHashtag = new ArrayList<String>(meetingDto.getHashtag());

                    //중복안된 태그 리스트
                    List<String> nonDuplicates = new ArrayList<String>();

                    //중복된 태그 리스트
                    List<String> duplicates = new ArrayList<String>();


                    //dto에 담긴 해시태그와 SET비교
                    for(String hashtag : meetingDto.getHashtag()){
                        if(checkSet.contains(hashtag)){
                            duplicates.add(hashtag);
                        }else{
                            nonDuplicates.add(hashtag);
                        }
                    }

                    //모든 해시태그가 중복되는 경우
                    if(nonDuplicates.size() <=0){
                        meetingDao.insertHashtag(meetingDto);    // "해시태그"테이블에 게시글Id값, 해시태그 타입Id insert
                    }else if(nonDuplicates.size() >=0) {
                        meetingDto.getHashtag().clear();  //hashtag리스트 초기화
                        meetingDto.getHashtag().addAll(nonDuplicates); // 중복안된 태그리스트 추가
                        meetingDao.insertHashtagTypes(meetingDto.getHashtag()); // 해시태그 타입 테이블에 해시태그 등록

                        meetingDto.getHashtag().clear();
                        meetingDto.setHashtag(tempHashtag);
                        meetingDao.insertHashtag(meetingDto);    // "해시태그"테이블에 게시글Id값, 해시태그 타입Id insert
                    }
                }

            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    //모임 게시글 조회수 증가
    public int increaseMeetingPostViewcnt(int regId) throws Exception{
        return meetingDao.increaseMeetingViewCnt(regId);
    }

    //모임 목록
    public List<MeetingDto> listMeeting() throws Exception{
        List<MeetingDto> meetings = meetingDao.getMeettingList();
        return meetings;
    }
    //모임 상세
    public MeetingDto getMeetingDetail(int regId) throws Exception{
        MeetingDto result = meetingDao.selectMeetingDetail(regId);
        return result;
    }


    //좋아요 등록 & 삭제
    public void updateLikeStatus(LikesDto likesDto){
        try{
            //내가 좋아요 한 기록이 있으면 기존 좋아요 삭제
            if(meetingDao.findMyLikes(likesDto)>0){
                meetingDao.deleteLikes(likesDto.getRegId());
            }else{
                //좋아요 기록이 없으면 좋아요 등록
                meetingDao.insertLikes(likesDto);
            }

        }catch (Exception e){
            throw new RuntimeException(e);
        }
    }

    //좋아요 리스트 추출 (Mypage)
    public List<MeetingDto> likesList() throws  Exception{
        return meetingDao.getLikesList();
    }

    //해시태그 조회
    public  List<HashtagDto> getHashtags() throws Exception{
        List<HashtagDto> hashtags = meetingDao.selectHashtag();
        return hashtags;
    }

    //누적 해시태그 랭킹
    public List<RankingDto> getTotalRank() throws  Exception{
        return meetingDao.selectToalRanking();
    }

    //주간 해시태그 랭킹
    public List<RankingDto> getWeeklyRank() throws  Exception{
        return meetingDao.selectWeeklyranking();
    }

    //주간 해시태그 테이블 삽입
    public int insertWeeklyrank()throws Exception{
        return meetingDao.insertWeeklyranking();
    }

    //해시태그 연관 게시글 보여주기
    public List<MeetingDto> getRelatedPosts(int tagtypeId) throws Exception{
        return meetingDao.selectRelatedPosts(tagtypeId);
    }
}
