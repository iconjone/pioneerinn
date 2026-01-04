# 1. Create assets directory if it doesn't exist
$dir = "assets"
if (!(Test-Path $dir)) {
    New-Item -ItemType Directory -Path $dir
    Write-Host "Created directory: $dir" -ForegroundColor Green
}

# 2. List of all images from the site
$imageUrls = @(
    "https://pioneerinn.us/wp-content/uploads/2020/12/Logo.png",
    "https://pioneerinn.us/wp-content/uploads/2020/12/16.jpg",
    "https://pioneerinn.us/wp-content/uploads/2020/12/Lobby1.jpg",
    "https://pioneerinn.us/wp-content/uploads/2020/12/Lobby2.jpg",
    "https://pioneerinn.us/wp-content/uploads/2020/12/Lobby3.jpg",
    "https://pioneerinn.us/wp-content/uploads/2020/12/Lobby4.jpg",
    "https://pioneerinn.us/wp-content/uploads/2020/12/MG_4196.jpg",
    "https://pioneerinn.us/wp-content/uploads/2020/12/PioneerInnSmokeFreeHotel.png",
    "https://pioneerinn.us/wp-content/uploads/2020/12/1.jpg",
    "https://pioneerinn.us/wp-content/uploads/2020/12/2.jpg",
    "https://pioneerinn.us/wp-content/uploads/2020/12/3.jpg",
    "https://pioneerinn.us/wp-content/uploads/2020/12/4.jpg",
    "https://pioneerinn.us/wp-content/uploads/2020/12/5.jpg",
    "https://pioneerinn.us/wp-content/uploads/2020/12/6.jpg",
    "https://pioneerinn.us/wp-content/uploads/2020/12/7.jpg",
    "https://pioneerinn.us/wp-content/uploads/2020/12/8.jpg",
    "https://pioneerinn.us/wp-content/uploads/2020/12/10.jpg",
    "https://pioneerinn.us/wp-content/uploads/2020/12/11.jpg",
    "https://pioneerinn.us/wp-content/uploads/2020/12/12.jpg",
    "https://pioneerinn.us/wp-content/uploads/2020/12/13.jpg",
    "https://pioneerinn.us/wp-content/uploads/2020/12/14.jpg",
    "https://pioneerinn.us/wp-content/uploads/2020/12/15.jpg",
    "https://pioneerinn.us/wp-content/uploads/2020/12/17.jpg",
    "https://pioneerinn.us/wp-content/uploads/2020/12/18.jpg",
    "https://pioneerinn.us/wp-content/uploads/2020/12/19.jpg",
    "https://pioneerinn.us/wp-content/uploads/2020/12/20.jpg",
    "https://pioneerinn.us/wp-content/uploads/2020/12/21.jpg",
    "https://pioneerinn.us/wp-content/uploads/2020/12/22.jpg"
)

Write-Host "Starting download of $($imageUrls.Count) images..." -ForegroundColor Cyan

# 3. Download each image
foreach ($url in $imageUrls) {
    $filename = Split-Path $url -Leaf
    $destination = Join-Path $dir $filename
    
    try {
        Invoke-WebRequest -Uri $url -OutFile $destination
        Write-Host "Successfully downloaded: $filename" -ForegroundColor Gray
    } catch {
        Write-Host "Failed to download: $filename" -ForegroundColor Red
    }
}

Write-Host "All downloads complete!" -ForegroundColor Green