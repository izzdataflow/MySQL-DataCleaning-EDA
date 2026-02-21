# MySQL-DataCleaning-EDA

# MySQL Data Cleaning – Process Logs

This project demonstrates an **end-to-end workflow** in MySQL: from raw data import, through cleaning, to exploratory analysis (EDA).  
Below are the documented steps, each linked with supporting images.

---

## 📌 Project Steps

1. **Open MySQL, connect to server**  

2. **Create new schema** – named `world_layoffs`  
   ![Step 2](assets/data-cleaning-images/1.Create_Schema_MySQL.png)

3. **Import data**  
   - `world_layoffs` → Table Data Import Wizard  
   - Create new table, correct data types (kept raw for this project)  
   - Refresh schema after finishing  
   ![Step 3](assets/data-cleaning-images/2.Import_Data_MySQL.png)

4. **List cleaning plan**  
   - Remove duplicates  
   - Standardize data  
   - Handle NULL/blank values  
   - Remove unnecessary columns  
   
5. **Create staging table** – `layoffs_staging` for raw data before cleaning  

6. **Insert data** from `layoffs` into `layoffs_staging`  
   ![Step 6](assets/data-cleaning-images/3.Create_Staging_table_MySQL.png)

7. **Work only with staging table** (`layoffs_staging`) for best practice  

8. **Remove duplicate rows**  
   - Create CTEs  
   - Create `layoffs_staging2`  
   - Insert CTE results into `layoffs_staging2`  
   - Delete duplicates (safe mode off)  

   ![Step 8a – Create CTEs](assets/data-cleaning-images/4.Remove_Duplicate_Rows_MySQL.png)  
   ![Step 8b – Create staging2](assets/data-cleaning-images/5.Remove_Duplicate_Rows_MySQL2.png)  
   ![Step 8c – Delete duplicates](assets/data-cleaning-images/6.Remove_Duplicate_Rows_MySQL3.png)

9. **Standardize data**  
   - Use `TRIM()`  
   - Merge similar values into consistent categories  
   - Change data types (e.g., `date` column → DATE type)  

   ![Step 9a – TRIM and merge values](assets/data-cleaning-images/7.Standardize_the_Data_MySQL.png)  
   ![Step 9b – Change data type to DATE](assets/data-cleaning-images/8.Standardize_the_Data_MySQL2.png)

10. **Handle NULL/blank values**  
    - Update or remove based on context
      
    ![Step 10a – Identify NULL/blank values](assets/data-cleaning-images/9.NULL_or_BLANK_Values_MySQL.png)  
    ![Step 10b – Update or remove rows](assets/data-cleaning-images/10.NULL_or_BLANK_Values_MySQL2.png)


11. **Remove temporary columns** used during cleaning  
    ![Step 11](assets/data-cleaning-images/11.Remove_temp_column_MySQL.png)

---

## ✅ Outcome
✅ Cleaned dataset ready for EDA.  
📂 Documented SQL scripts in [data_cleaning/scripts](data_cleaning/scripts)  
🖼️ Screenshots and workflow images in [assets/data-cleaning-images](assets/data-cleaning-images)

