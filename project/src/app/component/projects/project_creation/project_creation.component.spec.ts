import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ProjectCreationComponent } from './project_creation.component';

describe('ProjectComponent', () => {
  let component: ProjectCreationComponent;
  let fixture: ComponentFixture<ProjectCreationComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ProjectCreationComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ProjectCreationComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
