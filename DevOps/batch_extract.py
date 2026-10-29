import os
import glob
import json
import pymupdf

target_dir = r"C:\Users\krisapat\Desktop\Year_4, Semester_1\DevOps"
pdf_files = sorted(glob.glob(os.path.join(target_dir, "*.pdf")))

print(f"Found {len(pdf_files)} PDF files.")

results = []

for pdf_path in pdf_files:
    doc = pymupdf.open(pdf_path)
    base_name = os.path.splitext(os.path.basename(pdf_path))[0]
    out_md_path = os.path.join(target_dir, f"{base_name}.md")
    
    lines = [
        f"# เอกสารการบรรยาย: {base_name}\n",
        f"> ไฟล์ต้นฉบับ: `{os.path.basename(pdf_path)}` | จำนวนหน้าทั้งหมด: {len(doc)} หน้า\n",
        "---\n"
    ]
    
    sparse_pages = []
    
    for i, page in enumerate(doc):
        p_num = i + 1
        text = page.get_text().strip()
        imgs = page.get_images()
        
        lines.append(f"## Slide Page {p_num}\n")
        if text:
            lines.append(text + "\n")
        else:
            lines.append("*(ไม่มีข้อความดิจิทัลบนสไลด์หน้านี้)*\n")
            
        if len(imgs) > 0:
            lines.append(f"> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ {len(imgs)} รายการ]\n")
            if len(text) < 80:
                sparse_pages.append(p_num)
                
        lines.append("\n---\n")
        
    with open(out_md_path, "w", encoding="utf-8") as f:
        f.write("\n".join(lines))
        
    res = {
        "pdf": os.path.basename(pdf_path),
        "total_pages": len(doc),
        "output_md": os.path.basename(out_md_path),
        "sparse_pages_count": len(sparse_pages),
        "sparse_pages": sparse_pages
    }
    results.append(res)
    print(f"Extracted {res['pdf']}: {res['total_pages']} pages, {res['sparse_pages_count']} sparse pages")

with open(os.path.join(target_dir, "extraction_manifest.json"), "w", encoding="utf-8") as f:
    json.dump(results, f, indent=2, ensure_ascii=False)

print("Batch extraction complete.")
