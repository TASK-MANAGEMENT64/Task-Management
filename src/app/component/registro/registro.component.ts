import { Component } from '@angular/core';
import {FormBuilder, ReactiveFormsModule, Validators} from '@angular/forms';
import {Router, RouterLink} from '@angular/router';
import { MessageService } from 'primeng/api';
import {CardModule} from "primeng/card";
import {InputTextModule} from "primeng/inputtext";
import {NgIf} from "@angular/common";
import {ButtonModule} from "primeng/button";

@Component({
  selector: 'app-register',
  templateUrl: './registro.component.html',
  standalone: true,
  imports: [
    ReactiveFormsModule,
    CardModule,
    InputTextModule,
    NgIf,
    ButtonModule,
    RouterLink
  ],
  providers: [MessageService],
  styleUrls: ['./registro.component.css']
})
export class RegisterComponent {

  registerForm = this.fb.group({
    fullName: ['', [Validators.required, Validators.pattern(/^[a-zA-Z]+(?: [a-zA-Z]+)*$/)]],
    email: ['', [Validators.required, Validators.email]],
    password: ['', Validators.required],
    confirmPassword: ['', Validators.required]
  }, { })

  constructor(
    private fb: FormBuilder,
    private messageService: MessageService,
    private router: Router
  ) { }

  get fullName() {
    return this.registerForm.controls['fullName'];
  }

  get email() {
    return this.registerForm.controls['email'];
  }

  get password() {
    return this.registerForm.controls['password'];
  }

  get confirmPassword() {
    return this.registerForm.controls['confirmPassword'];
  }

}
