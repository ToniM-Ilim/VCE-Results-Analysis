library(readxl)
library(dplyr)
library(purrr)
library(janitor)
library(stringr)

SSCAI_2014 <- read_excel("SSCAI2014.xlsx")%>%
  mutate(year = 2014)%>%
  clean_names()%>%
  select(school, small_school, locality, 
         number_of_students_enrolled_in_at_least_one_vce_unit_at_level_3_4_in_2014,
         number_of_vce_studies_at_unit_3_4_level_taken_up_by_students_in_2014,
         number_of_students_enrolled_in_a_vet_certificate_in_2014,
         number_of_students_enrolled_in_vcal_in_2014,
         percentage_of_vce_students_applying_for_tertiary_places,
         median_vce_study_score,
         percentage_of_study_scores_of_40_and_over,
         year)%>%
  rename(num_vce_students_enrolled = number_of_students_enrolled_in_at_least_one_vce_unit_at_level_3_4_in_2014,
         num_vce_studies = number_of_vce_studies_at_unit_3_4_level_taken_up_by_students_in_2014,
         num_vet_students_enrolled = number_of_students_enrolled_in_a_vet_certificate_in_2014,
         num_vcal_students_enrolled = number_of_students_enrolled_in_vcal_in_2014,
         percent_vce_studs_apply_tert =percentage_of_vce_students_applying_for_tertiary_places,
         median_vce_ss = median_vce_study_score,
         percent_ss_40plus = percentage_of_study_scores_of_40_and_over)

SSCAI_2015 <- read_excel("SSCAI2015.xlsx")%>%
  mutate(year = 2015)%>%
  clean_names()%>%
  select(school, small_school, locality, 
         number_of_students_enrolled_in_at_least_one_vce_unit_at_level_3_4_in_2015,
         number_of_vce_studies_at_unit_3_4_level_taken_up_by_students_in_2015,
         number_of_students_enrolled_in_a_vet_certificate_in_2015,
         number_of_students_enrolled_in_vcal_in_2015,
         percentage_of_vce_students_applying_for_tertiary_places,
         median_vce_study_score,
         percentage_of_study_scores_of_40_and_over,
         year)%>%
  rename(num_vce_students_enrolled = number_of_students_enrolled_in_at_least_one_vce_unit_at_level_3_4_in_2015,
         num_vce_studies = number_of_vce_studies_at_unit_3_4_level_taken_up_by_students_in_2015,
         num_vet_students_enrolled = number_of_students_enrolled_in_a_vet_certificate_in_2015,
         num_vcal_students_enrolled = number_of_students_enrolled_in_vcal_in_2015,
         percent_vce_studs_apply_tert =percentage_of_vce_students_applying_for_tertiary_places,
         median_vce_ss = median_vce_study_score,
         percent_ss_40plus = percentage_of_study_scores_of_40_and_over)

SSCAI_2016 <- read_excel("SSCAI2016.xlsx")%>%
  mutate(year = 2016)%>%
  clean_names()%>%
  select(school, small_school, locality, 
         number_of_students_enrolled_in_at_least_one_vce_unit_at_level_3_4_in_2016,
         number_of_vce_studies_at_unit_3_4_level_taken_up_by_students_in_2016,
         number_of_students_enrolled_in_a_vet_certificate_in_2016,
         number_of_students_enrolled_in_vcal_in_2016,
         percentage_of_vce_students_applying_for_tertiary_places,
         median_vce_study_score,
         percentage_of_study_scores_of_40_and_over,
         year)%>%
  rename(num_vce_students_enrolled = number_of_students_enrolled_in_at_least_one_vce_unit_at_level_3_4_in_2016,
         num_vce_studies = number_of_vce_studies_at_unit_3_4_level_taken_up_by_students_in_2016,
         num_vet_students_enrolled = number_of_students_enrolled_in_a_vet_certificate_in_2016,
         num_vcal_students_enrolled = number_of_students_enrolled_in_vcal_in_2016,
         percent_vce_studs_apply_tert =percentage_of_vce_students_applying_for_tertiary_places,
         median_vce_ss = median_vce_study_score,
         percent_ss_40plus = percentage_of_study_scores_of_40_and_over)

SSCAI_2017 <- read_excel("SSCAI2017.xlsx")%>%
  mutate(year = 2017)%>%
  clean_names()%>%
  select(school, small_school, locality, 
         number_of_students_enrolled_in_at_least_one_vce_unit_at_level_3_4_in_2017,
         number_of_vce_studies_at_unit_3_4_level_taken_up_by_students_in_2017,
         number_of_students_enrolled_in_a_vet_certificate_in_2017,
         number_of_students_enrolled_in_vcal_in_2017,
         percentage_of_vce_students_applying_for_tertiary_places,
         median_vce_study_score,
         percentage_of_study_scores_of_40_and_over,
         year)%>%
  rename(num_vce_students_enrolled = number_of_students_enrolled_in_at_least_one_vce_unit_at_level_3_4_in_2017,
         num_vce_studies = number_of_vce_studies_at_unit_3_4_level_taken_up_by_students_in_2017,
         num_vet_students_enrolled = number_of_students_enrolled_in_a_vet_certificate_in_2017,
         num_vcal_students_enrolled = number_of_students_enrolled_in_vcal_in_2017,
         percent_vce_studs_apply_tert =percentage_of_vce_students_applying_for_tertiary_places,
         median_vce_ss = median_vce_study_score,
         percent_ss_40plus = percentage_of_study_scores_of_40_and_over)

SSCAI_2018 <- read_excel("SSCAI2018.xlsx")%>%
  mutate(year = 2018)%>%
  clean_names()%>%
  select(school, small_school, locality, 
         number_of_students_enrolled_in_at_least_one_vce_unit_at_level_3_4_in_2018,
         number_of_vce_studies_at_unit_3_4_level_taken_up_by_students_in_2018,
         number_of_students_enrolled_in_a_vet_certificate_in_2018,
         number_of_students_enrolled_in_vcal_in_2018,
         percentage_of_vce_students_applying_for_tertiary_places,
         median_vce_study_score,
         percentage_of_study_scores_of_40_and_over,
         year)%>%
  rename(num_vce_students_enrolled = number_of_students_enrolled_in_at_least_one_vce_unit_at_level_3_4_in_2018,
         num_vce_studies = number_of_vce_studies_at_unit_3_4_level_taken_up_by_students_in_2018,
         num_vet_students_enrolled = number_of_students_enrolled_in_a_vet_certificate_in_2018,
         num_vcal_students_enrolled = number_of_students_enrolled_in_vcal_in_2018,
         percent_vce_studs_apply_tert =percentage_of_vce_students_applying_for_tertiary_places,
         median_vce_ss = median_vce_study_score,
         percent_ss_40plus = percentage_of_study_scores_of_40_and_over)

SSCAI_2019 <- read_excel("SSCAI2019.xlsx")%>%
  mutate(year = 2019)%>%
  clean_names()%>%
  select(school, small_school, locality, 
         number_of_students_enrolled_in_at_least_one_vce_unit_at_level_3_4_in_2019,
         number_of_vce_studies_at_unit_3_4_level_taken_up_by_students_in_2019,
         number_of_students_enrolled_in_a_vet_certificate_in_2019,
         number_of_students_enrolled_in_vcal_in_2019,
         percentage_of_vce_students_applying_for_tertiary_places,
         median_vce_study_score,
         percentage_of_study_scores_of_40_and_over,
         year)%>%
  rename(num_vce_students_enrolled = number_of_students_enrolled_in_at_least_one_vce_unit_at_level_3_4_in_2019,
         num_vce_studies = number_of_vce_studies_at_unit_3_4_level_taken_up_by_students_in_2019,
         num_vet_students_enrolled = number_of_students_enrolled_in_a_vet_certificate_in_2019,
         num_vcal_students_enrolled = number_of_students_enrolled_in_vcal_in_2019,
         percent_vce_studs_apply_tert =percentage_of_vce_students_applying_for_tertiary_places,
         median_vce_ss = median_vce_study_score,
         percent_ss_40plus = percentage_of_study_scores_of_40_and_over)

SSCAI_2020 <- read_excel("SSCAI2020.xlsx")%>%
  mutate(year = 2020)%>%
  clean_names()%>%
  select(school, small_school, locality, 
         number_of_students_enrolled_in_at_least_one_vce_unit_at_level_3_4_in_2020,
         number_of_vce_studies_at_unit_3_4_level_taken_up_by_students_in_2020,
         number_of_students_enrolled_in_a_vet_certificate_in_2020,
         number_of_students_enrolled_in_vcal_in_2020,
         percentage_of_vce_students_applying_for_tertiary_places,
         median_vce_study_score,
         percentage_of_study_scores_of_40_and_over,
         year)%>%
  rename(num_vce_students_enrolled = number_of_students_enrolled_in_at_least_one_vce_unit_at_level_3_4_in_2020,
         num_vce_studies = number_of_vce_studies_at_unit_3_4_level_taken_up_by_students_in_2020,
         num_vet_students_enrolled = number_of_students_enrolled_in_a_vet_certificate_in_2020,
         num_vcal_students_enrolled = number_of_students_enrolled_in_vcal_in_2020,
         percent_vce_studs_apply_tert =percentage_of_vce_students_applying_for_tertiary_places,
         median_vce_ss = median_vce_study_score,
         percent_ss_40plus = percentage_of_study_scores_of_40_and_over)

SSCAI_2021 <- read_excel("2021SeniorSecondaryCompletionAndAchievementInformation.xlsx")%>%
  mutate(year = 2021)%>%
  clean_names()%>%
  select(school, small_school, locality, 
         number_of_students_enrolled_in_at_least_one_vce_unit_at_level_3_4_in_2021,
         number_of_vce_studies_at_unit_3_4_level_taken_up_by_students_in_2021,
         number_of_students_enrolled_in_a_vet_certificate_in_2021,
         number_of_students_enrolled_in_vcal_in_2021,
         percentage_of_vce_students_applying_for_tertiary_places,
         median_vce_study_score,
         percentage_of_study_scores_of_40_and_over,
         year)%>%
  rename(num_vce_students_enrolled = number_of_students_enrolled_in_at_least_one_vce_unit_at_level_3_4_in_2021,
         num_vce_studies = number_of_vce_studies_at_unit_3_4_level_taken_up_by_students_in_2021,
         num_vet_students_enrolled = number_of_students_enrolled_in_a_vet_certificate_in_2021,
         num_vcal_students_enrolled = number_of_students_enrolled_in_vcal_in_2021,
         percent_vce_studs_apply_tert =percentage_of_vce_students_applying_for_tertiary_places,
         median_vce_ss = median_vce_study_score,
         percent_ss_40plus = percentage_of_study_scores_of_40_and_over)

SSCAI_2022 <- read_excel("2022SeniorSecondaryCompletionAndAchievementInformation.xlsx")%>%
  mutate(year = 2022)%>%
  clean_names()%>%
  select(school, small_school, locality, 
         number_of_students_enrolled_in_at_least_one_vce_unit_at_level_3_4_in_2022,
         number_of_vce_studies_at_unit_3_4_level_taken_up_by_students_in_2022,
         number_of_students_enrolled_in_a_vet_certificate_in_2022,
         number_of_students_enrolled_in_vcal_in_2022,
         percentage_of_vce_students_applying_for_tertiary_places,
         median_vce_study_score,
         percentage_of_study_scores_of_40_and_over,
         year)%>%
  rename(num_vce_students_enrolled = number_of_students_enrolled_in_at_least_one_vce_unit_at_level_3_4_in_2022,
         num_vce_studies = number_of_vce_studies_at_unit_3_4_level_taken_up_by_students_in_2022,
         num_vet_students_enrolled = number_of_students_enrolled_in_a_vet_certificate_in_2022,
         num_vcal_students_enrolled = number_of_students_enrolled_in_vcal_in_2022,
         percent_vce_studs_apply_tert =percentage_of_vce_students_applying_for_tertiary_places,
         median_vce_ss = median_vce_study_score,
         percent_ss_40plus = percentage_of_study_scores_of_40_and_over)

SSCAI_2023 <- read_excel("2023SeniorSecondaryCompletionAndAchievementInformation.xlsx")%>%
  mutate(year = 2023)%>%
  clean_names()%>%
  select(school, small_school, locality, 
         number_of_students_enrolled_in_at_least_one_vce_or_vce_vocational_major_vm_study_at_units_3_and_4,
         number_of_vce_and_vce_vocational_major_vm_studies_at_units_3_and_4_level_with_enrolments,
         number_of_students_enrolled_in_a_vocational_education_and_training_vet_certificate,
         number_of_students_enrolled_in_the_victorian_certificate_of_applied_learning_vcal_at_intermediate_level_2023_only,
         percentage_of_vce_students_applying_for_tertiary_places_through_the_victorian_tertiary_admissions_centre_vtac,
         median_vce_study_score,
         percentage_of_study_scores_of_40_and_over,
         year)%>%
  rename(num_vce_students_enrolled = number_of_students_enrolled_in_at_least_one_vce_or_vce_vocational_major_vm_study_at_units_3_and_4,
         num_vce_studies = number_of_vce_and_vce_vocational_major_vm_studies_at_units_3_and_4_level_with_enrolments,
         num_vet_students_enrolled = number_of_students_enrolled_in_a_vocational_education_and_training_vet_certificate,
         num_vcal_students_enrolled = number_of_students_enrolled_in_the_victorian_certificate_of_applied_learning_vcal_at_intermediate_level_2023_only,
         percent_vce_studs_apply_tert =percentage_of_vce_students_applying_for_tertiary_places_through_the_victorian_tertiary_admissions_centre_vtac,
         median_vce_ss = median_vce_study_score,
         percent_ss_40plus = percentage_of_study_scores_of_40_and_over)

SSCAI_2024 <- read_excel("2024SeniorSecondaryCompletionAndAchievementInformation.xlsx")%>%
  mutate(year = 2024)%>%
  clean_names()%>%
  select(school, small_school, locality, 
         number_of_students_enrolled_in_at_least_one_vce_or_vce_vocational_major_vm_study_or_vce_vet_program_at_units_3_and_4_level,
         number_of_vce_vce_vocational_major_vm_studies_and_vce_vet_programs_at_units_3_and_4_level_with_enrolments,
         number_of_students_enrolled_in_a_vocational_education_and_training_vet_certificate,
         percentage_of_vce_students_applying_for_tertiary_places_through_the_victorian_tertiary_admissions_centre_vtac,
         median_vce_study_score,
         percentage_of_study_scores_of_40_and_over,
         year)%>%
  rename(num_vce_students_enrolled = number_of_students_enrolled_in_at_least_one_vce_or_vce_vocational_major_vm_study_or_vce_vet_program_at_units_3_and_4_level,
         num_vce_studies = number_of_vce_vce_vocational_major_vm_studies_and_vce_vet_programs_at_units_3_and_4_level_with_enrolments,
         num_vet_students_enrolled = number_of_students_enrolled_in_a_vocational_education_and_training_vet_certificate,
         percent_vce_studs_apply_tert =percentage_of_vce_students_applying_for_tertiary_places_through_the_victorian_tertiary_admissions_centre_vtac,
         median_vce_ss = median_vce_study_score,
         percent_ss_40plus = percentage_of_study_scores_of_40_and_over)

VCE_School_Results <- bind_rows(list(SSCAI_2014, SSCAI_2015,
                                    SSCAI_2016, SSCAI_2017,
                                     SSCAI_2018, SSCAI_2019,
                                     SSCAI_2020, SSCAI_2021,
                                     SSCAI_2022,SSCAI_2023, SSCAI_2024))%>%
  mutate(school = case_when(str_detect(school, "Ilim College of Australia") ~ "Ilim College",
                            str_detect(school, "Ilim College Boys Campus") ~ "Ilim College Kiewa Campus",
                            TRUE ~ school),
         school_loc = paste(school," ", locality))
        


write.csv(VCE_School_Results, file ="VCE_School_Results.csv", row.names = FALSE)
