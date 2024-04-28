import { Component } from '@angular/core';
import {ProjectCreationComponent} from "../projects/project_creation/project_creation.component";
import {MatIconModule} from '@angular/material/icon';
import {MatButtonModule} from '@angular/material/button';
import {MatToolbarModule} from '@angular/material/toolbar';
import {MatSidenavModule} from '@angular/material/sidenav';
import {ProjectPreviewComponent} from "../projects/project_preview/project_preview.component";
import {ProjectMenuComponent} from "../projects/project_menu/project_menu.component";
import {MatDivider} from "@angular/material/divider";
import {MatList, MatListItem} from "@angular/material/list";
import {RouterLink, RouterLinkActive, RouterOutlet} from "@angular/router";

@Component({
  selector: 'app-main-menu',
  standalone: true,
  imports: [ProjectCreationComponent, MatToolbarModule, MatButtonModule, MatIconModule,
    MatSidenavModule, ProjectPreviewComponent, ProjectMenuComponent, MatDivider, MatList,
    MatListItem, RouterLink, RouterLinkActive, RouterOutlet],
  templateUrl: './main_menu.component.html',
  styleUrl: './main_menu.component.css'
})
export class MainMenuComponent {
}
