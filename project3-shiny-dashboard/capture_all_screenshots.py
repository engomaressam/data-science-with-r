import os
import sys
import time
import base64
from pathlib import Path

def save_base64_as_png(base64_data, filename):
    """Convert base64 image data to PNG file"""
    try:
        # Remove data URL prefix if present
        if base64_data.startswith('data:image'):
            base64_data = base64_data.split(',')[1]
        
        # Decode base64 data
        image_data = base64.b64decode(base64_data)
        
        # Ensure screenshots directory exists
        screenshots_dir = Path("screenshots")
        screenshots_dir.mkdir(exist_ok=True)
        
        # Save to file
        filepath = screenshots_dir / filename
        with open(filepath, 'wb') as f:
            f.write(image_data)
        
        print(f"✓ Saved {filename}")
        return True
    except Exception as e:
        print(f"✗ Error saving {filename}: {e}")
        return False

def main():
    if len(sys.argv) != 3:
        print("Usage: python capture_all_screenshots.py <base64_data> <filename>")
        sys.exit(1)
    
    base64_data = sys.argv[1]
    filename = sys.argv[2]
    
    success = save_base64_as_png(base64_data, filename)
    if success:
        print(f"Screenshot saved successfully as {filename}")
    else:
        print(f"Failed to save screenshot as {filename}")
        sys.exit(1)

if __name__ == "__main__":
    main()