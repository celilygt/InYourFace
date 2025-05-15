package celilygt.in_your_face

import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.graphics.Paint
import android.view.View
import android.widget.RemoteViews
import es.antonborri.home_widget.HomeWidgetLaunchIntent
import es.antonborri.home_widget.HomeWidgetPlugin
import java.text.SimpleDateFormat
import java.util.Date
import java.util.Locale

class VisibleTasksWidgetProvider : AppWidgetProvider() {

    override fun onUpdate(context: Context, appWidgetManager: AppWidgetManager, appWidgetIds: IntArray) {
        appWidgetIds.forEach { appWidgetId ->
            // Get data from SharedPreferences (saved by Flutter)
            val widgetData = HomeWidgetPlugin.getData(context)
            val views = RemoteViews(context.packageName, R.layout.visible_tasks_widget_layout).apply {

                // Retrieve task data
                val task1Title = widgetData.getString("task_1_title", "")
                val task1Done = widgetData.getBoolean("task_1_done", false)
                val task2Title = widgetData.getString("task_2_title", "")
                val task2Done = widgetData.getBoolean("task_2_done", false)
                val task3Title = widgetData.getString("task_3_title", "")
                val task3Done = widgetData.getBoolean("task_3_done", false)

                // Task 1
                if (task1Title?.isNotEmpty() == true) {
                    setTextViewText(R.id.widget_task_1_title, task1Title)
                    setInt(R.id.widget_task_1_title, "setPaintFlags", if (task1Done) Paint.STRIKE_THRU_TEXT_FLAG or Paint.ANTI_ALIAS_FLAG else Paint.ANTI_ALIAS_FLAG)
                    setViewVisibility(R.id.widget_task_1_title, View.VISIBLE)
                } else {
                    setViewVisibility(R.id.widget_task_1_title, View.GONE)
                }

                // Task 2
                if (task2Title?.isNotEmpty() == true) {
                    setTextViewText(R.id.widget_task_2_title, task2Title)
                    setInt(R.id.widget_task_2_title, "setPaintFlags", if (task2Done) Paint.STRIKE_THRU_TEXT_FLAG or Paint.ANTI_ALIAS_FLAG else Paint.ANTI_ALIAS_FLAG)
                    setViewVisibility(R.id.widget_task_2_title, View.VISIBLE)
                } else {
                    setViewVisibility(R.id.widget_task_2_title, View.GONE)
                }

                // Task 3
                if (task3Title?.isNotEmpty() == true) {
                    setTextViewText(R.id.widget_task_3_title, task3Title)
                    setInt(R.id.widget_task_3_title, "setPaintFlags", if (task3Done) Paint.STRIKE_THRU_TEXT_FLAG or Paint.ANTI_ALIAS_FLAG else Paint.ANTI_ALIAS_FLAG)
                    setViewVisibility(R.id.widget_task_3_title, View.VISIBLE)
                } else {
                    setViewVisibility(R.id.widget_task_3_title, View.GONE)
                }
                
                // Update Time
                val sdf = SimpleDateFormat("hh:mm a", Locale.getDefault())
                setTextViewText(R.id.widget_update_time, "Updated: ${sdf.format(Date())}")

                // Intent to launch app when widget is clicked
                val launchIntent = HomeWidgetLaunchIntent.getActivity(
                        context,
                        MainActivity::class.java)
                setOnClickPendingIntent(R.id.widget_container, launchIntent)
            }
            appWidgetManager.updateAppWidget(appWidgetId, views)
        }
    }
} 