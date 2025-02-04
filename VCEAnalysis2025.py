import streamlit as st
import pandas as pd
import plotly.express as px
import plotly.graph_objects as go

## alternate debugging #
import sys
import subprocess

try:
    import plotly.express as px
except ModuleNotFoundError:
    print("Plotly is missing. Installing now...")
    subprocess.run([sys.executable, "-m", "pip", "install", "plotly"])

st.set_page_config(page_title="Ilim College VCE Results", page_icon=":bar_chart:", layout="wide")
st.title(" :bar_chart: VCE Study Score Trends")


@st.cache_data
def load_data():
    df = pd.read_csv("VCE_School_Results.csv")  # Load dataset
    df["median_vce_ss"] = pd.to_numeric(df["median_vce_ss"], errors="coerce")  # Convert to numeric
    df["year"] = df["year"].astype(int)  # ✅ Ensure year is an integer (removes commas)
    df["percent_ss_40plus"]=pd.to_numeric(df["percent_ss_40plus"], errors = "coerce") # Convert to numericreturn df
    df["num_vce_students_enrolled"] = pd.to_numeric(df["num_vce_students_enrolled"], errors = "coerce") # ensure this is a number - removes commas
    df["num_vce_studies"]=pd.to_numeric(df["num_vce_studies"], errors = "coerce") # ensure this is a number - removes commas)
    df["num_vet_students_enrolled"] = pd.to_numeric(df["num_vet_students_enrolled"],errors = "coerce")
    df["num_vcal_students_enrolled"] = pd.to_numeric(df["num_vcal_students_enrolled"], errors = "coerce")
    df["percent_vce_studs_apply_tert"] = pd.to_numeric(df["percent_vce_studs_apply_tert"], errors = "coerce")                      
    return df
df = load_data()

# Sidebar - Select Schools for Filtering
st.sidebar.header("Select Schools to Compare with Ilim College")
schools = df["school"].unique().tolist()
default_schools = ["Minaret College", "Islamic College of Melbourne"]  # Default selections

selected_schools = st.sidebar.multiselect(
    "Choose schools:",
    options=schools,
    default=default_schools
)
import streamlit as st

st.write('''Data sourced and combined from VCAA directly and via [VCAA Research and Statistics](https://www.vcaa.vic.edu.au/administration/research-and-statistics/Pages/SeniorSecondaryCompletion.aspx)\n
Each year, and for every study, the mean study score is set at 30.
A raw study score of 40 plus indicates students are in the top 9% of students in the state.''')

# Ensure "Ilim College" and its variations are always included
ilim_variants = df[df["school"].str.contains("Ilim College", case=False, na=False)]["school"].unique().tolist()

# Add all "Ilim College" variations if not already selected
selected_schools.extend(school for school in ilim_variants if school not in selected_schools)

# Filter Data
filtered_df = df[df["school"].isin(selected_schools)]

# ✅ Sort by `school_loc` to group similar schools together
filtered_df = filtered_df.sort_values(by=["school_loc", "year"])

# Debugging outputs
st.write(f"Selected Schools: {selected_schools}")
st.write(f"Filtered Data: {filtered_df.shape[0]} rows")
st.dataframe(
                    filtered_df,width = 5000, height = 300,
                    hide_index = True,
                    column_order = (
                        "year",
                        "school",
                        "locality",
                        "median_vce_ss",
                        "percent_ss_40plus",
                        "num_vce_students_enrolled",
                        "num_vce_studies",
                        "num_vet_students_enrolled",
                        "num_vcal_students_enrolled",
                        "percent_vce_studs_apply_tert"
                    ),
                    column_config={
                        "year":st.column_config.NumberColumn("Year", format="%d"),
                        "school":st.column_config.TextColumn("School"),
                        "locality":st.column_config.TextColumn("Campus Location"),
                        "median_vce_ss": "Median Study Score", 
                        "percent_ss_40plus":"Study Scores 40 plus",
                        "num_vce_students_enrolled":st.column_config.NumberColumn("Number of Students Enrolled",
                                                                                help ="Includes all students enrolled in at least one VCE or VCE Vocational Major (VM) study or VCE VET program at Units 3 and 4 level"
                        ),
                        "num_vce_studies":st.column_config.NumberColumn("Number of VCE Studies Offered",
                                                                                help ="Includes all VCE, VCE Vocational Major (VM) studies and VCE VET programs at Units 3 and 4 level with enrolments"),
                        "num_vet_students_enrolled":st.column_config.NumberColumn("Number of VET Certificate Students",
                                                                                help ="Includes all students enrolled in a Vocational Education and Training (VET) certificate"),
                        "num_vcal_students_enrolled":st.column_config.NumberColumn("Number of VCAL Certificate Students",
                                                                                help ="Includes all students enrolled in a Vocational Education and Training (VET) certificate"),
                        "percent_vce_studs_apply_tert":st.column_config.NumberColumn("Students Applying for Tertiary Places %",
                                                                                help ="through the Victorian Tertiary Admissions Centre (VTAC")
                        }
                        )

# Check if the filtered data is empty
if filtered_df.empty:
    st.warning("No data available for the selected schools.")
else:
    # 🔹 First Plot: Median Study Scores
    st.title("Study Score Comparisons")  # Main Section Heading
    st.subheader("Median VCE Study Scores Over Time")  # Subheading for clarity
    
    fig = px.line(
        filtered_df,
        x="year",
        y="median_vce_ss",
        color="school_loc",
        markers=True,
        labels={"school_loc": "Campus Location", "median_vce_ss": "Median VCE Score", "year": "Year"}
    )
        # Add a horizontal line at y = 30 (State Mean Score)
    fig.add_hline(
        y=30, 
        line_dash="dash",  # Optional: Dashed line style
        line_color="black",  # Optional: Choose line color
        annotation_text="Mean Score",  # Optional: Label
        annotation_position="top left"  # Adjust label position
    )
    st.plotly_chart(fig)  # Ensure this is placed immediately after the heading

    # 🔹 Second Plot: 40+ Study Scores
    st.subheader("Percentage of 40 Plus Study Scores by Schools")  # Subheading instead of title
    
    fig_1 = px.line(
        filtered_df,
        x="year",
        y="percent_ss_40plus",
        color="school_loc",
        markers=True,
        labels={"school_loc": "Campus Location", "percent_ss_40plus": "Percentage %", "year": "Year"}
    )
    st.plotly_chart(fig_1)  # Ensure this is placed immediately after its heading

    # 🔹 Third Plot: Number of students enrolled
    st.subheader("Number of students enrolled in Unit 3 and 4 subjects")  # Subheading instead of title
    
    # Create bar plot
    fig_2 = px.bar(
        filtered_df,
        x="year",
        y="num_vce_students_enrolled",
        color="school_loc",  # Group by school location
        barmode="group",  # Groups bars by school
        labels={"school_loc": "Campus Location", "num_vce_students_enrolled": "Number of Students", "year": "Year"}
    )
    st.plotly_chart(fig_2)  # Ensure placement immediately after its heading

    # 🔹 Fourth Plot: Number of students enrolled
    st.subheader("Number of VCE studies offered with enrolments")  # Subheading instead of title
  
 # Create bar plot
    fig_3 = px.bar(
        filtered_df,
        x="year",
        y="num_vce_studies",
        color="school_loc",  # Group by school location
        barmode="group",  # Groups bars by school
        labels={"school_loc": "Campus Location", "num_vce_studies": "Number of Studies", "year": "Year"}
    )
    st.plotly_chart(fig_3)  # Ensure placement immediately after its heading

import os
print(os.path.exists("VCE_School_Results.csv"))
