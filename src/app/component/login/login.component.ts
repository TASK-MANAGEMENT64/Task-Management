import { Component } from '@angular/core';
import { FormBuilder, FormsModule, ReactiveFormsModule, Validators,} from '@angular/forms';
import { Router, RouterLink } from '@angular/router';
import {MatCardModule} from "@angular/material/card";
import { MatInputModule } from '@angular/material/input';
import { MatButton } from '@angular/material/button';
import {NgIf} from "@angular/common";

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  standalone: true,
  imports: [
    FormsModule,
    RouterLink,
    ReactiveFormsModule,
    MatCardModule,
    MatInputModule,
    MatButton,
    NgIf,
  ],
  styleUrls: ['./login.component.css'],
})
export class LoginComponent {
  loginForm = this.fb.group({
    email: ['', [Validators.required, Validators.email]],
    password: ['', Validators.required],
  });

  constructor(
    private fb: FormBuilder,
    private router: Router,
  ) {}

  get email() {
    return this.loginForm.controls['email'];
  }
  get password() {
    return this.loginForm.controls['password'];
  }
}
