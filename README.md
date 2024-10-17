
# Livestock Production Monitoring with Live Weather Data

This R Shiny app provides a **real-time monitoring solution** for **livestock production** (simulated milk yield) combined with **live weather data** fetched from the **Open-Meteo API**. The application simulates the milk yield data of dairy cows and displays it alongside live weather conditions, allowing farmers or agricultural scientists to investigate how environmental factors impact livestock productivity.

## Features

- **Simulated Milk Yield Data**: Generate milk yield data over a user-specified number of hours.
- **Live Weather Data**: Fetch live weather data (temperature and wind speed) using Open-Meteo API based on user input for latitude and longitude.
- **Interactive Plot**: Visualize simulated milk yield over time with an interactive line plot using `ggplot2`.
- **Weather Information**: Display real-time temperature and wind speed for the specified location.

## Use Cases

This app is designed for:
- **Dairy Farmers**: Monitor milk production trends and identify correlations with weather conditions (e.g., temperature, wind speed).
- **Agricultural Researchers**: Study how environmental factors influence livestock behavior and productivity.
- **Data Scientists**: Apply data visualization and analysis techniques to agricultural problems.

## How to Use the App

### 1. Installation

To run this app locally, follow the steps below:

#### Prerequisites

Ensure that you have the following installed:
- [R](https://cran.r-project.org/) (version 4.0 or higher)
- [RStudio](https://www.rstudio.com/products/rstudio/download/)
- Required R libraries:
  - `shiny`
  - `httr`
  - `jsonlite`
  - `ggplot2`
  - `dplyr`

You can install these R packages using the following commands in your R console:

```r
install.packages(c("shiny", "httr", "jsonlite", "ggplot2", "dplyr"))
```

### 2. Clone the Repository

Clone this repository to your local machine:

```bash
git clone https://github.com/yourusername/livestock-weather-monitoring.git
```

### 3. Running the App

After cloning the repository, you can run the app by opening the `app.R` file in RStudio and clicking the "Run App" button, or by using the following command in your R console:

```r
shiny::runApp("path_to_app_directory")
```

### 4. Usage

Once the app is running:
- Enter the **latitude and longitude** for your desired location (e.g., for Dublin, enter `53.3498,-6.2603`).
- Specify the number of hours for which you want to **simulate milk yield**.
- Click the **Update Data** button to fetch the live weather data and generate the milk yield plot.

## App Structure

- **UI Layout**: 
  - Input fields for specifying location (latitude, longitude) and hours of data to simulate.
  - An action button to update data and fetch the latest information.
  - Output fields for displaying live weather data and an interactive plot for milk yield.

- **Backend**:
  - The app uses the **Open-Meteo API** to fetch live weather information based on the user's input.
  - Milk yield data is generated using a normal distribution to simulate hourly production values.

## Example Output

- **Weather at the location**: Displays the current temperature and wind speed for the specified location.
- **Simulated Milk Yield Over Time**: Visualizes the milk yield trend over the past specified hours.



## Future Improvements

- **Integrate real sensor data**: Replace the simulated milk yield data with real-world sensor data from dairy farms.
- **Expand weather metrics**: Add more weather metrics such as humidity, precipitation, and wind direction.
- **Add predictive models**: Incorporate machine learning models to forecast future milk yield based on historical weather and production data.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Acknowledgments

- **Open-Meteo API**: For providing free, no-key-required weather data.
- **RStudio**: For providing the platform to run Shiny apps.
```

### **Steps to Customize**:
1. **Replace `https://github.com/yourusername/livestock-weather-monitoring.git`** with your actual GitHub repository link.
2. **Replace `path_to_your_screenshot`** with the actual path to your app screenshot within your repo (e.g., `assets/screenshot.png`).
3. Update the **License** section if you want to use a different license than MIT.

This README file will help others understand the purpose of the app, how to install and use it, and give a clear overview of its features. Feel free to adjust the future improvements and usage cases to suit your vision for the app!
