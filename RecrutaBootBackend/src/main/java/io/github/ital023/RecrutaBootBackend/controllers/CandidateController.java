package io.github.ital023.RecrutaBootBackend.controllers;

import io.github.ital023.RecrutaBootBackend.dto.CandidateDTO;
import io.github.ital023.RecrutaBootBackend.services.CandidateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping(value = "/candidate")
public class CandidateController {

    @Autowired
    private CandidateService service;

    @GetMapping
    public ResponseEntity<List<CandidateDTO>> getAll() {
        List<CandidateDTO> candidateDTOS = service.getAll();
        return ResponseEntity.ok(candidateDTOS);
    }

}
