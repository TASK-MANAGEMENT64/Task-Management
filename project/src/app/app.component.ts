import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import {MainMenuComponent} from "./component/main-menu/main_menu.component";

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, MainMenuComponent],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent {
  title = 'project';
}
