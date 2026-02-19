package com.hack.hackatonmerca.web.controller;

import com.hack.hackatonmerca.domain.model.Jpa.AppUser;
import com.hack.hackatonmerca.domain.repository.AppUserRepository;
import com.hack.hackatonmerca.security.JwtService;
import jakarta.annotation.security.PermitAll;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/auth")
public class AuthController {

    private final AppUserRepository repo;
    private final PasswordEncoder encoder;
    private final AuthenticationManager authManager;
    private final JwtService jwtService;

    public AuthController(
            AppUserRepository repo,
            PasswordEncoder encoder,
            AuthenticationManager authManager,
            JwtService jwtService
    ) {
        this.repo = repo;
        this.encoder = encoder;
        this.authManager = authManager;
        this.jwtService = jwtService;
    }

    public record RegisterRequest(String username, String password) {}
    public record LoginRequest(String username, String password) {}
    public record LoginResponse(String accessToken) {}

    @PostMapping("/register")
    @PermitAll
    public ResponseEntity<?> register(@RequestBody RegisterRequest req) {
        if (req.username() == null || req.username().isBlank()
                || req.password() == null || req.password().length() < 6) {
            return ResponseEntity.badRequest().body("Invalid username/password");
        }

        if (repo.existsByUsername(req.username())) {
            return ResponseEntity.status(409).body("Username already exists");
        }

        var u = new AppUser();
        u.setUsername(req.username());
        u.setPasswordHash(encoder.encode(req.password()));
        u.getRoles().add("USER");
        repo.save(u);

        return ResponseEntity.status(201).build();
    }

    @PostMapping("/login")
    @PermitAll
    public ResponseEntity<?> login(@RequestBody LoginRequest req) {
        try {
            var token = new UsernamePasswordAuthenticationToken(req.username(), req.password());
            var auth = authManager.authenticate(token);

            var roles = auth.getAuthorities().stream()
                    .map(a -> a.getAuthority()) // ROLE_USER, ROLE_ADMIN...
                    .toList();

            var jwt = jwtService.createToken(auth.getName(), roles);
            return ResponseEntity.ok(new LoginResponse(jwt));

        } catch (AuthenticationException e) {
            return ResponseEntity.status(401).build();
        }
    }
}
