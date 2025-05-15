# Application Theme Documentation

This document outlines the visual theme of the InYourFace application, based on the provided UI designs.

## 1. Color Palette

### Light Theme
*   **Primary Purple:** `#4A44C6` (Deep Purple)
    *   Usage: Main interactive elements, headers, primary buttons, active states, bottom navigation background
*   **Secondary Purple:** `#8A84FF` (Medium Purple)
    *   Usage: Secondary elements, icons, highlights, borders
*   **Light Purple:** `#E1BEE7` (Very Light Purple)
    *   Usage: Backgrounds, fills for charts, subtle highlights, secondary backgrounds
*   **Primary Text Color:** `#212121` (Very Dark Grey / Off-Black)
    *   Usage: Headings, main body text, important information
*   **Secondary Text Color:** `#757575` (Medium Grey)
    *   Usage: Subtitles, captions, less important information, placeholder text
*   **White:** `#FFFFFF`
    *   Usage: Card backgrounds, text on dark backgrounds
*   **Light Grey:** `#F5F5F5` (Very Light Grey)
    *   Usage: App background, dividers, borders, unselected states
*   **Success Green:** `#4CAF50`
    *   Usage: Positive indicators, completed tasks, success states
*   **Accent Blue:** `#42A5F5` (Light Blue)
    *   Usage: Links, alternative highlights, secondary actions
*   **Warning Orange:** `#FF9800`
    *   Usage: Warnings, caution indicators
*   **Error Red:** `#F44336`
    *   Usage: Errors, important alerts

### Dark Theme
*   **Primary Purple:** `#6A5CFF` (Brighter Purple)
    *   Usage: Same as light theme but slightly brighter for visibility
*   **Secondary Purple:** `#9D97FF` (Light Purple)
    *   Usage: Same as light theme but adjusted for dark backgrounds
*   **Dark Background:** `#121212` (Nearly Black)
    *   Usage: App background
*   **Card Background:** `#242424` (Dark Grey)
    *   Usage: Card backgrounds, elevated surfaces
*   **Primary Text Color:** `#FFFFFF` (White)
    *   Usage: Headings, main body text
*   **Secondary Text Color:** `#BBBBBB` (Light Grey)
    *   Usage: Subtitles, captions, less important information
*   **Divider Color:** `#323232` (Mid Grey)
    *   Usage: Dividers, borders
*   **Success Green:** `#66BB6A` (Lighter Green)
    *   Usage: Same as light theme but adjusted for visibility
*   **Accent Blue:** `#64B5F6` (Brighter Blue)
    *   Usage: Same as light theme but adjusted for visibility
*   **Warning Orange:** `#FFA726` (Brighter Orange)
    *   Usage: Same as light theme but adjusted for visibility
*   **Error Red:** `#EF5350` (Brighter Red)
    *   Usage: Same as light theme but adjusted for visibility

## 2. Typography

*   **Font Family:** Sans-serif (e.g., Roboto, Open Sans, Noto Sans - system default preferred for cross-platform consistency)
*   **Headings:**
    *   **App Title/Screen Title:** 
        * Style: Uppercase, Bold
        * Size: 20sp
        * Color: White on Primary Purple background, Primary Text Color on white background
    *   **Card Titles/Section Headers:** 
        * Style: Regular/Medium Weight
        * Size: 16sp
        * Color: Primary Text Color
    *   **Large Display Text:** 
        * Style: Bold
        * Size: 28-36sp
        * Color: Primary Text Color (light theme), White (dark theme)
*   **Body Text:**
    *   Style: Regular Weight
    *   Size: 14-16sp
    *   Color: Primary Text Color (light theme), White (dark theme)
*   **Captions/Subtitles:**
    *   Style: Regular/Light Weight
    *   Size: 12sp
    *   Color: Secondary Text Color (light theme), Secondary Text Color (dark theme)
*   **Button Text:**
    *   Style: Medium Weight
    *   Size: 14sp
    *   Color: White on Primary Purple, Primary Text Color on Light Grey
*   **Tab Text:**
    *   Style: Medium Weight
    *   Size: 14sp
    *   Color: Same as Button Text
*   **Input Field Labels:**
    *   Style: Medium Weight
    *   Size: 12sp
    *   Color: Secondary Purple
*   **Hint Text/Placeholders:**
    *   Style: Regular Weight
    *   Size: 14sp
    *   Color: Secondary Text Color

## 3. UI Component Styling

### Common Elements

#### Cards
*   **Light Theme:**
    *   Background: White (`#FFFFFF`)
    *   Border Radius: 12px
    *   Shadow: 0px 2px 8px rgba(0, 0, 0, 0.08)
    *   Padding: 16px
*   **Dark Theme:**
    *   Background: Card Background (`#242424`)
    *   Border Radius: 12px
    *   Shadow: 0px 2px 8px rgba(0, 0, 0, 0.2)
    *   Padding: 16px

#### Buttons
*   **Primary Button:**
    *   **Light Theme:**
        *   Background: Primary Purple
        *   Text: White
        *   Border Radius: 24px (full rounded for standalone), 8px for contained
        *   Height: 48px
        *   Padding: 0 24px
    *   **Dark Theme:**
        *   Background: Primary Purple
        *   Text: White
        *   Other properties: Same as light theme
*   **Secondary Button:**
    *   **Light Theme:**
        *   Background: White
        *   Text: Primary Purple
        *   Border: 1px solid Primary Purple
        *   Border Radius: Same as Primary Button
    *   **Dark Theme:**
        *   Background: Transparent
        *   Text: Primary Purple
        *   Border: 1px solid Primary Purple
        *   Border Radius: Same as Primary Button
*   **Text Button:**
    *   **Light Theme:**
        *   Background: Transparent
        *   Text: Primary Purple
        *   No Border
    *   **Dark Theme:**
        *   Background: Transparent
        *   Text: Primary Purple
        *   No Border

#### Input Fields
*   **Text Field:**
    *   **Light Theme:**
        *   Background: White
        *   Border: 1px solid Light Grey
        *   Border Radius: 8px
        *   Text Color: Primary Text Color
        *   Height: 48px
        *   Focus State: Border color changes to Primary Purple
    *   **Dark Theme:**
        *   Background: Card Background
        *   Border: 1px solid Divider Color
        *   Focus State: Border color changes to Primary Purple
        *   Other properties: Same as light theme
*   **Password Field:** Same as Text Field, with password visibility toggle icon
*   **Search Field:**
    *   Similar to Text Field
    *   Includes search icon on the left
    *   Border Radius: 24px
    *   Background: Light Grey (light theme), Darker Grey (dark theme)

#### Tabs/Segmented Controls
*   **Light Theme:**
    *   Selected: Primary Purple background, White text
    *   Unselected: White/Transparent background, Secondary Text Color
    *   Border Radius: 8px
    *   Padding: 8px 16px
*   **Dark Theme:**
    *   Selected: Primary Purple background, White text
    *   Unselected: Transparent background, Secondary Text Color
    *   Other properties: Same as light theme

#### Bottom Navigation
*   **Light Theme:**
    *   Background: White
    *   Selected Icon: Primary Purple, with indicator
    *   Unselected Icon: Secondary Text Color
    *   Height: 56px
*   **Dark Theme:**
    *   Background: Card Background
    *   Selected Icon: Primary Purple, with indicator
    *   Unselected Icon: Secondary Text Color (light grey)
    *   Height: 56px

#### Top App Bar
*   **Light Theme:**
    *   Background: Primary Purple (gradient to Secondary Purple optional)
    *   Text/Icons: White
    *   Height: 56dp
    *   Elevation: 4dp
*   **Dark Theme:**
    *   Background: Dark Background
    *   Text/Icons: White
    *   Other properties: Same as light theme

### Specialized Components

#### Progress Indicators
*   **Circular Progress:**
    *   **Light Theme:**
        *   Track: Light Grey
        *   Progress: Primary Purple
        *   Text: Primary Text Color (center text)
        *   Size: Variable (64dp-120dp common)
    *   **Dark Theme:**
        *   Track: Divider Color
        *   Other properties: Same as light theme
*   **Linear Progress:**
    *   **Light Theme:**
        *   Track: Light Grey
        *   Progress: Primary Purple
        *   Height: 4-8dp
    *   **Dark Theme:**
        *   Track: Divider Color
        *   Other properties: Same as light theme

#### Charts & Visualizations
*   **Bar Chart:**
    *   **Light Theme:**
        *   Bars: Primary Purple
        *   Axes: Light Grey
        *   Labels: Secondary Text Color
        *   Grid Lines: Light Grey
    *   **Dark Theme:**
        *   Bars: Primary Purple
        *   Axes: Divider Color
        *   Labels: Secondary Text Color
        *   Grid Lines: Divider Color
*   **Line Chart:**
    *   **Light Theme:**
        *   Line: Primary Purple
        *   Area Fill: Light Purple (semi-transparent)
        *   Points: Primary Purple
        *   Grid Lines: Light Grey
    *   **Dark Theme:**
        *   Line: Primary Purple
        *   Area Fill: Light Purple (semi-transparent)
        *   Points: Primary Purple
        *   Grid Lines: Divider Color

#### Calendar/Date Components
*   **Calendar Grid:**
    *   **Light Theme:**
        *   Background: White
        *   Selected Date: Primary Purple background, White text
        *   Today: Border in Primary Purple
        *   Other Dates: Primary Text Color
        *   Inactive Dates: Secondary Text Color
    *   **Dark Theme:**
        *   Background: Card Background
        *   Other properties: Same as light theme
*   **Date Picker:**
    *   Similar styling to Calendar Grid
    *   Month/Year Selector: Secondary Purple

#### Lists & Menu Items
*   **List Item:**
    *   **Light Theme:**
        *   Background: White
        *   Text: Primary Text Color
        *   Selected State: Light Purple background
        *   Height: 56-72dp depending on content
        *   Divider: Light Grey, 1dp height
    *   **Dark Theme:**
        *   Background: Card Background
        *   Text: White
        *   Selected State: Dark Purple (semi-transparent)
        *   Divider: Divider Color
*   **Menu:**
    *   **Light Theme:**
        *   Background: White
        *   Text: Primary Text Color
        *   Selected Item: Light Purple background
        *   Elevation: 8dp
        *   Border Radius: 4dp
    *   **Dark Theme:**
        *   Background: Card Background
        *   Other properties: Same as light theme

#### Toggle Controls
*   **Checkbox:**
    *   **Light Theme:**
        *   Unchecked: Outline in Secondary Text Color
        *   Checked: Primary Purple fill, White checkmark
        *   Size: 18-24dp
    *   **Dark Theme:**
        *   Unchecked: Outline in Secondary Text Color
        *   Other properties: Same as light theme
*   **Switch:**
    *   **Light Theme:**
        *   Off: Grey track, Light Grey thumb
        *   On: Light Purple track, Primary Purple thumb
        *   Height: 24dp
    *   **Dark Theme:**
        *   Off: Dark Grey track, Grey thumb
        *   Other properties: Same as light theme
*   **Radio Button:**
    *   **Light Theme:**
        *   Unselected: Outline in Secondary Text Color
        *   Selected: Primary Purple outer ring, Primary Purple center dot
        *   Size: 18-24dp
    *   **Dark Theme:**
        *   Unselected: Outline in Secondary Text Color
        *   Other properties: Same as light theme

#### Task/Checklist Items
*   **Light Theme:**
    *   Uncompleted: Regular list item with checkbox
    *   Completed: Checkbox checked, text with strikethrough and Secondary Text Color
*   **Dark Theme:**
    *   Same behaviors with dark theme colors

#### Splash Screen & Onboarding
*   **Splash Screen:**
    *   Full-screen Primary Purple background
    *   Logo/app icon centered, in White
*   **Onboarding:**
    *   Bold headings in Primary Purple (light theme) or White (dark theme)
    *   Illustrations/graphics
    *   Clear CTA buttons (Primary Button style)

#### Home Screen Widget
*   **Light Theme:**
    *   Background: White with subtle shadow
    *   Title: Primary Text Color, Bold
    *   Tasks: Regular list items with checkboxes
    *   Border Radius: 12dp
    *   Padding: 16dp
*   **Dark Theme:**
    *   Background: Card Background
    *   Title: White, Bold
    *   Other properties: Same as light theme

## 4. Spacing & Layout

*   **Grid System:** 8dp base grid
*   **Margins:**
    *   Screen Edge Margins: 16dp
    *   Content Block Margins: 8dp or 16dp
*   **Padding:**
    *   Container Padding: 16dp
    *   Between Related Items: 8dp
    *   Between Unrelated Items: 16dp or 24dp
*   **Component Spacing:**
    *   Related Components: 8dp separation
    *   Section Separators: 24dp
    *   Form Fields: 16dp between fields

## 5. Iconography

*   **Style:** Simple, clean, line-art or filled depending on context
*   **Size:**
    *   Navigation Icons: 24dp
    *   Action Icons: 24dp
    *   Small Icons/Indicators: 16-18dp
*   **Colors:**
    *   **Light Theme:**
        *   On light background: Primary Purple or Secondary Text Color
        *   On dark/colored background: White
    *   **Dark Theme:**
        *   On dark background: Primary Purple or White
        *   On light/colored background: White

*   **Common Icons:**
    *   **Navigation:**
        *   Home: House icon
        *   Calendar: Calendar icon
        *   User/Profile: Person icon
        *   Dashboard: Chart/grid icon
    *   **Actions:**
        *   Add: Plus icon
        *   Delete: Trash icon
        *   Edit: Pencil icon
        *   Search: Magnifying glass icon
        *   Settings: Gear icon
    *   **Status:**
        *   Complete/Success: Check mark
        *   Error/Warning: Exclamation mark
        *   Info: "i" icon
        *   Notification: Bell icon

## 6. Motion & Animation

*   **Transitions:**
    *   Page Transitions: Slide or fade, 300ms duration, ease-in-out curve
    *   Component Entry: Subtle fade or scale, 200ms duration
    *   Component Exit: Fade out, 200ms duration
*   **Interactive Feedback:**
    *   Button Press: Scale down slightly (95%), 100ms duration
    *   Ripple Effect: From touch point, 300ms duration
    *   Selection Changes: 200ms color transition
*   **Progress Animations:**
    *   Loading Spinners: Continuous rotation, 1500ms per cycle
    *   Progress Bars: Smooth fill animation

## 7. Accessibility

*   **Color Contrast:**
    *   Text on backgrounds meets WCAG AA standard (4.5:1 for normal text, 3:1 for large text)
    *   Interactive elements have sufficient contrast
*   **Touch Targets:**
    *   Minimum size of 48x48dp
    *   Adequate spacing between interactive elements (at least 8dp)
*   **Text Scaling:**
    *   All text scales appropriately with system font size settings
*   **Alternative Text:**
    *   All images and icons have appropriate content descriptions

This theme guide ensures a consistent, cohesive user experience across the InYourFace application in both light and dark themes, with a focus on the purple, black, and white color palette. 