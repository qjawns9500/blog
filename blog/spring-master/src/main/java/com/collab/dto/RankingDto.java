package com.collab.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RankingDto {
    String tagContent; //태그 이름
    int totalCount; // 누적 해시태그 수
}
