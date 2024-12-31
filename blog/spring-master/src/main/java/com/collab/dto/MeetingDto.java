package com.collab.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class MeetingDto {
    private int regId;
    private String thumbnail;
    private String title;
    private String content;
    private String createDate;
    private String strPeriod;
    private String endPeriod;
    private String deleteYn;
    private String categoryId;
    private List<String> hashtag;
    private int likeCnt; // 좋아요 갯수 카운팅
    private int viewCnt; // 조회수
}
