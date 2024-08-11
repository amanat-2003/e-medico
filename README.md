# e-medico

e-medico is a Flutter-based mobile application designed to provide users with detailed information about various diseases and their respective medications. The app allows users to browse diseases, view recommended treatments, and manage a personalized list of medicines.

## Features

- **Diseases Page**: 
  - Lists various diseases along with their recovery days and available treatment types (Allopathy, Homeopathy, Ayurvedic).
  - Clicking on a disease card navigates to a detailed disease page.

- **Disease Details Page**: 
  - Displays a picture of the disease.
  - Provides a description, risk level, and estimated recovery time.
  - Lists available medicines for the disease.
  - Clicking on a medicine opens the specific medicine details page.

- **Medicines Page**:
  - Lists all available medicines.
  - Clicking on a medicine opens a detailed medicine page.
  - Includes a pop-up option to view and manage "My Medicines."

- **Medicine Details Page**:
  - Provides details such as description, price, dosage, ingredients, and storage instructions.
  - Users can add or remove the medicine from "My Medicines."

- **Filters Page**:
  - Filters on Medicines:
    - No Allopathic Medicine
    - No Ayurvedic Medicine
    - No Homeopathic Medicine
    - No Medicines
  - Filters on Diseases:
    - No Low-Risk Disease
    - No Moderate-Risk Disease
    - No High-Risk Disease

## Technologies Used

- **Flutter**
- **Riverpod** for state management
- **Shared Preferences** for local data storage

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/amanat-2003/e-medico.git
   ```
2. Navigate to the project directory:
   ```bash
   cd e-medico
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Run the app:
   ```bash
   flutter run
   ```

## Demo

[![Watch the Demo](https://img.youtube.com/vi/XaRpdOfUIGA/0.jpg)](https://www.youtube.com/watch?v=XaRpdOfUIGA)

## Contributions

Contributions are welcome! Please fork this repository and submit a pull request for any bug fixes, feature additions, or improvements.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact

For any inquiries, you can reach me at [amanatsinghnain@gmail.com](mailto:amanatsinghnain@gmail.com).

## Acknowledgments

- Thanks to the Flutter community for the resources and support.
