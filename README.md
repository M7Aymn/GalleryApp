# GalleryApp

GalleryApp is a photo gallery app that allows users to view albums, photos, and their profile information, including their name and address. The app supports image zooming, sharing, and handles image loading and error states gracefully.

Built with **Moya**, **Combine**, and **Kingfisher**, the app provides efficient image loading, smooth interactions, and a reactive approach to handling data.

## Features

- **User Profile**: Displays user’s name and address.
- **Albums**: Browse and view albums.
- **Photos**: View and zoom in on photos within albums.
- **Sharing**: Share photos via various platforms.
- **Image Loading**: Asynchronous image loading with **Kingfisher**, including caching.
- **NetworkManagerProtocol**: Abstracts network operations for better maintainability and testing.

## Usage

### Main Features

- **User Profile & Albums**: On launch, users see their profile with their name and address, followed by a list of albums associated with them. Tapping on an album opens a gallery of photos.
- **Photo Viewing & Zooming**: Inside an album, users can view photos. By tapping a photo, it opens in full-screen mode with pinch-to-zoom functionality.
- **Sharing**: Users can share any photo via the system’s share sheet, enabling sharing through social media, messaging, or email.

### Extra Handling

- **Loading Indicator**: A loading indicator is displayed while fetching images or data.
- **Empty List Message**: If no albums or photos are available, an informative message is shown.
- **Error Handling**: Error alerts notify users of network issues, and fallback images are shown if image loading fails.

## Screenshots


<img src="https://github.com/user-attachments/assets/b670042f-89e3-4dfd-a3ae-f64deff7d8d3" width="180"/>
<img src="https://github.com/user-attachments/assets/71116b52-d1d0-46cc-be42-91c670fe6b8d" width="180"/>
<img src="https://github.com/user-attachments/assets/441b48b2-971f-446d-b127-94f634c39120" width="180"/>
<img src="https://github.com/user-attachments/assets/bcc44e20-eff7-4478-bd10-244c30e3881c" width="180"/>
<img src="https://github.com/user-attachments/assets/e9e6800b-a48f-4041-911a-36a4ba80df96" width="180"/>
<img src="https://github.com/user-attachments/assets/c5b4c055-0cca-40c0-8156-75ddfea77cdf" width="180"/>
<img src="https://github.com/user-attachments/assets/c0bc1707-3278-4312-bb41-28a79766a9d9" width="180"/>
<img src="https://github.com/user-attachments/assets/85d7a9b0-5b08-41c0-83d3-485b347f8154" width="180"/>
<img src="https://github.com/user-attachments/assets/6df20c8e-5dee-4d47-9a49-ef5dd803b0f3" width="180"/>
<img src="https://github.com/user-attachments/assets/26c6d97d-10a2-4c37-a374-679ee442a970" width="180"/>
<img src="https://github.com/user-attachments/assets/57f9f5de-6a48-4dfc-a442-40cb80bbf28c" width="180"/>
<img src="https://github.com/user-attachments/assets/17ad3292-f207-4e21-b73e-d5d17c8f83dd" width="180"/>
<img src="https://github.com/user-attachments/assets/3f4de484-db28-4425-be23-56bd1c8036b1" width="180"/>
<img src="https://github.com/user-attachments/assets/6ff3848a-3bd2-4382-b9a1-9dec97b0185f" width="180"/>
<img src="https://github.com/user-attachments/assets/1575ac9c-a194-448a-be17-5556fa248ee3" width="180"/>
<img src="https://github.com/user-attachments/assets/c429e76e-da37-4206-a6d6-5bbdac6714d7" width="180"/>
<img src="https://github.com/user-attachments/assets/c44b3b68-76c3-4b35-abad-ffc1fba561f0" width="180"/>
<img src="https://github.com/user-attachments/assets/981561f7-4e81-4b93-958e-73abee50fc16" width="180"/>
<img src="https://github.com/user-attachments/assets/f45b6089-2364-47ac-926f-14c51a5cd4f4" width="180"/>

