package com.Unicon.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.Unicon.domain.MemberVO;
import com.Unicon.persistence.MemberDAO;

public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    private MemberDAO memberDAO;

    @Override
    public UserDetails loadUserByUsername(String memberId) throws UsernameNotFoundException {
        // 사용자 정보 조회 (여기서 MemberDAO 사용)
        MemberVO member = memberDAO.getMemberByUsername(memberId);

        // 사용자가 존재하지 않으면 예외를 던짐
        if (member == null) {
            throw new UsernameNotFoundException("User not found: " + memberId);
        }

        // 'approval_status'가 '완료'인지 확인
        if (!"완료".equals(member.getApproval_status())) {
            throw new UsernameNotFoundException("User is not approved: " + memberId);
        }

        // 사용자의 권한 설정 (여기서는 'ROLE_MEMBER'만 설정)
        return new User(
                member.getMember_id(),              // username
                member.getMember_pw(),              // password
                true,                             // account non-locked
                true,                             // credentials non-expired
                true,                             // account non-expired
                true,                             // enabled
                AuthorityUtils.createAuthorityList("ROLE_MEMBER")  // 권한 설정
        );
    }
}
