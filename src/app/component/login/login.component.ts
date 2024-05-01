import { Component } from '@angular/core';
import {FormBuilder, FormsModule, ReactiveFormsModule, Validators} from '@angular/forms';
import {Router, RouterLink} from '@angular/router';
import { MessageService } from 'primeng/api';
import {CardModule} from "primeng/card";
import {InputTextModule} from "primeng/inputtext";
import {ButtonModule} from "primeng/button";
import {NgIf} from "@angular/common";
import "primeng/resources/themes/saga-blue/theme.css";
import "primeng/resources/primeng.min.css";
import "primeicons/primeicons.css";


@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  standalone: true,
  imports: [
    CardModule,
    InputTextModule,
    FormsModule,
    ButtonModule,
    RouterLink,
    NgIf,
    ReactiveFormsModule,
  ],
  providers: [MessageService],
  styleUrls: ['./login.component.css']
})
export class LoginComponent {
  loginForm = this.fb.group({
    email: ['', [Validators.required, Validators.email]],
    password: ['', Validators.required]
  })

  constructor(
    private fb: FormBuilder,
    private router: Router,
    private msgService: MessageService
  ) { }

  get email() {
    return this.loginForm.controls['email'];
  }
  get password() { return this.loginForm.controls['password']; }

}
