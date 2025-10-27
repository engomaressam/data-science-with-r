import base64
import os

def save_base64_as_png(base64_data, filename):
    """
    Convert base64 image data to PNG file
    """
    try:
        # Remove the data:image/png;base64, prefix if present
        if base64_data.startswith('data:image/png;base64,'):
            base64_data = base64_data.replace('data:image/png;base64,', '')
        if base64_data.startswith('data:image/'):  # handle generic data URLs
            base64_data = base64_data.split(',')[1]
        
        # Decode base64 to binary
        image_data = base64.b64decode(base64_data)
        
        # Ensure screenshots directory exists
        os.makedirs('screenshots', exist_ok=True)
        
        # Save to PNG file
        filepath = os.path.join('screenshots', filename)
        with open(filepath, 'wb') as f:
            f.write(image_data)
        
        print(f"Successfully saved: {filepath}")
        return True
        
    except Exception as e:
        print(f"Error saving {filename}: {str(e)}")
        return False

def main():
    """
    This script will be called with base64 data OR a file path containing base64.
    Usage:
      python save_screenshots.py <base64_or_path> <filename>
    """
    import sys
    
    if len(sys.argv) != 3:
        print("Usage: python save_screenshots.py <base64_or_path> <filename>")
        sys.exit(1)
    
    base64_or_path = sys.argv[1]
    filename = sys.argv[2]
    
    # If the first arg looks like a file path and exists, read contents
    if os.path.exists(base64_or_path) and os.path.isfile(base64_or_path):
        try:
            with open(base64_or_path, 'r', encoding='utf-8') as f:
                base64_data = f.read().strip()
        except Exception as e:
            print(f"Error reading base64 file '{base64_or_path}': {e}")
            sys.exit(1)
    else:
        base64_data = base64_or_path
    
    success = save_base64_as_png(base64_data, filename)
    sys.exit(0 if success else 1)

if __name__ == "__main__":
    main()