package io.github.ital023.RecrutaBootBackend.repositories;

import io.github.ital023.RecrutaBootBackend.entities.GithubProfile;
import org.springframework.data.jpa.repository.JpaRepository;

public interface GithubProfileRepository extends JpaRepository<GithubProfile, Long> {
}
