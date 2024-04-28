import { ComponentFixture, TestBed } from '@angular/core/testing';

import { Project_previewComponent } from './project_preview.component';

describe('ProjectDetailsComponent', () => {
  let component: Project_previewComponent;
  let fixture: ComponentFixture<Project_previewComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [Project_previewComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(Project_previewComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
