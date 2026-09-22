package com.dyh.doctor;

import com.ulisesbocchio.jasyptspringboot.annotation.EnableEncryptableProperties;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@EnableEncryptableProperties
@MapperScan("com.dyh.doctor.mapper")
public class SpbYqApplication {

    public static void main(String[] args) {
        SpringApplication.run(SpbYqApplication.class, args);
    }

}
