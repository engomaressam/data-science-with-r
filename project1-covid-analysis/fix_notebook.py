import json

# Read the notebook
with open('final_jupyter_covid19.ipynb', 'r', encoding='utf-8') as f:
    notebook = json.load(f)

# Create the corrected code for cell 48 with NA handling
corrected_lines = [
    "# Use if-else statement\n",
    "# if (check which confirmed.population value is greater) {\n",
    "#    print()\n",
    "# } else {\n",
    "#    print()\n",
    "# }\n",
    "\n",
    "us_ratio <- country1_data$confirmed.population.ratio[1]\n",
    "germany_ratio <- country2_data$confirmed.population.ratio[1]\n",
    "\n",
    "# Check for missing values and handle them\n",
    "if (is.na(us_ratio) || is.na(germany_ratio)) {\n",
    "    print(\"One or both countries have missing ratio data\")\n",
    "    print(paste(\"US ratio:\", us_ratio))\n",
    "    print(paste(\"Germany ratio:\", germany_ratio))\n",
    "} else if (us_ratio > germany_ratio) {\n",
    "    print(paste(\"United States has a higher confirmed-to-population ratio:\", us_ratio, \"vs\", germany_ratio))\n",
    "} else {\n",
    "    print(paste(\"Germany has a higher confirmed-to-population ratio:\", germany_ratio, \"vs\", us_ratio))\n",
    "}"
]

# Update cell 48
notebook['cells'][48]['source'] = corrected_lines

# Write the updated notebook back
with open('final_jupyter_covid19.ipynb', 'w', encoding='utf-8') as f:
    json.dump(notebook, f, indent=2, ensure_ascii=False)

print('Notebook updated successfully!')
print('Fixed the if statement with proper NA handling.')