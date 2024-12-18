package com.Unicon.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class SecurityConfig extends WebSecurityConfigurerAdapter {
    
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
            .csrf()
                .ignoringAntMatchers("/notice/api/**")  // CSRF 제외 패턴 수정
            .and()
            .authorizeRequests()
                .antMatchers("/notice/api/**").permitAll()
                .antMatchers("/notice/manage/**").hasRole("ADMIN")
                .antMatchers("/notice/**").permitAll()
                .anyRequest().authenticated()
            .and()
            .formLogin()
                .loginPage("/login")
                .defaultSuccessUrl("/")
                .permitAll()
            .and()
            .logout()
            	.logoutUrl("/logout")
                .logoutSuccessUrl("/login/customLogin")
                .invalidateHttpSession(true);
    }
}
