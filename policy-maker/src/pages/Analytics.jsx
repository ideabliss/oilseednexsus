import { useState } from 'react'
import { BarChart, Bar, XAxis, YAxis, CartesianGrid, Tooltip, ResponsiveContainer, LineChart, Line, AreaChart, Area } from 'recharts'

export default function Analytics() {
  const [timeRange, setTimeRange] = useState('yearly')
  const [selectedMetric, setSelectedMetric] = useState('production')

  const forecastData = [
    { year: '2024-25', actual: 42.5, forecast: 45.2, target: 48.0 },
    { year: '2025-26', actual: null, forecast: 48.8, target: 52.5 },
    { year: '2026-27', actual: null, forecast: 53.1, target: 57.2 },
    { year: '2027-28', actual: null, forecast: 58.4, target: 62.0 },
    { year: '2028-29', actual: null, forecast: 63.2, target: 66.5 },
    { year: '2029-30', actual: null, forecast: 67.8, target: 69.7 }
  ]

  const importData = [
    { year: '2020-21', imports: 15.2, domestic: 24.8, dependency: 38 },
    { year: '2021-22', imports: 14.8, domestic: 26.1, dependency: 36 },
    { year: '2022-23', imports: 14.1, domestic: 28.3, dependency: 33 },
    { year: '2023-24', imports: 13.5, domestic: 30.7, dependency: 31 },
    { year: '2024-25', imports: 12.8, domestic: 33.2, dependency: 28 }
  ]

  const yieldData = [
    { crop: 'Soybean', current: 1.2, potential: 2.1, gap: 0.9 },
    { crop: 'Mustard', current: 1.4, potential: 2.3, gap: 0.9 },
    { crop: 'Groundnut', current: 1.8, potential: 2.8, gap: 1.0 },
    { crop: 'Sunflower', current: 1.1, potential: 1.9, gap: 0.8 }
  ]

  const riskFactors = [
    { factor: 'Climate Change', impact: 'High', probability: 85, mitigation: 'Drought-resistant varieties' },
    { factor: 'Market Volatility', impact: 'Medium', probability: 70, mitigation: 'Price stabilization fund' },
    { factor: 'Pest Outbreaks', impact: 'High', probability: 60, mitigation: 'Early warning systems' },
    { factor: 'Storage Losses', impact: 'Medium', probability: 55, mitigation: 'Modern storage facilities' }
  ]

  return (
    <div className="space-y-6">
      {/* Header */}
      <div className="bg-gradient-to-r from-purple-600 to-blue-600 rounded-2xl p-6 text-white">
        <h1 className="text-3xl font-bold mb-2">Advanced Analytics & Forecasting</h1>
        <p className="text-white/90">AI-powered insights for strategic planning and risk assessment</p>
      </div>

      {/* Controls */}
      <div className="bg-white rounded-2xl shadow-xl p-6 border border-gray-100">
        <div className="flex items-center justify-between">
          <div className="flex space-x-4">
            <select 
              value={timeRange} 
              onChange={(e) => setTimeRange(e.target.value)}
              className="bg-gray-50 rounded-xl px-4 py-2 border border-gray-200"
            >
              <option value="monthly">Monthly</option>
              <option value="quarterly">Quarterly</option>
              <option value="yearly">Yearly</option>
            </select>
            <select 
              value={selectedMetric} 
              onChange={(e) => setSelectedMetric(e.target.value)}
              className="bg-gray-50 rounded-xl px-4 py-2 border border-gray-200"
            >
              <option value="production">Production</option>
              <option value="yield">Yield</option>
              <option value="area">Area</option>
              <option value="imports">Imports</option>
            </select>
          </div>
          <div className="flex space-x-2">
            <button className="bg-gradient-to-r from-purple-500 to-blue-500 text-white px-4 py-2 rounded-xl hover:from-purple-600 hover:to-blue-600 transition-all duration-300 font-semibold">
              Generate Report
            </button>
            <button className="bg-gray-100 text-gray-700 px-4 py-2 rounded-xl hover:bg-gray-200 transition-all duration-300 font-semibold">
              Export Data
            </button>
          </div>
        </div>
      </div>

      {/* Forecast Chart */}
      <div className="bg-white rounded-2xl shadow-xl p-6 border border-gray-100">
        <h2 className="text-xl font-bold text-gray-900 mb-6 flex items-center">
          <span className="mr-3">🔮</span>
          Production Forecast vs Targets (2024-2030)
        </h2>
        <ResponsiveContainer width="100%" height={400}>
          <AreaChart data={forecastData}>
            <CartesianGrid strokeDasharray="3 3" stroke="#f0f0f0" />
            <XAxis dataKey="year" stroke="#6b7280" />
            <YAxis stroke="#6b7280" />
            <Tooltip 
              contentStyle={{ 
                backgroundColor: '#fff', 
                border: 'none', 
                borderRadius: '16px', 
                boxShadow: '0 20px 25px -5px rgba(0, 0, 0, 0.1)' 
              }} 
            />
            <Area type="monotone" dataKey="target" stackId="1" stroke="#EF4444" fill="#FEE2E2" />
            <Area type="monotone" dataKey="forecast" stackId="2" stroke="#3B82F6" fill="#DBEAFE" />
            <Line type="monotone" dataKey="actual" stroke="#10B981" strokeWidth={3} />
          </AreaChart>
        </ResponsiveContainer>
      </div>

      {/* Import Dependency & Yield Gap */}
      <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
        <div className="bg-white rounded-2xl shadow-xl p-6 border border-gray-100">
          <h2 className="text-xl font-bold text-gray-900 mb-6 flex items-center">
            <span className="mr-3">📉</span>
            Import Dependency Reduction
          </h2>
          <ResponsiveContainer width="100%" height={300}>
            <LineChart data={importData}>
              <CartesianGrid strokeDasharray="3 3" stroke="#f0f0f0" />
              <XAxis dataKey="year" stroke="#6b7280" />
              <YAxis stroke="#6b7280" />
              <Tooltip />
              <Line type="monotone" dataKey="dependency" stroke="#EF4444" strokeWidth={3} />
            </LineChart>
          </ResponsiveContainer>
          <div className="mt-4 p-4 bg-red-50 rounded-xl">
            <p className="text-sm text-red-800">
              <strong>Target:</strong> Reduce import dependency from 65% to 30% by 2030
            </p>
          </div>
        </div>

        <div className="bg-white rounded-2xl shadow-xl p-6 border border-gray-100">
          <h2 className="text-xl font-bold text-gray-900 mb-6 flex items-center">
            <span className="mr-3">📊</span>
            Yield Gap Analysis (T/Ha)
          </h2>
          <ResponsiveContainer width="100%" height={300}>
            <BarChart data={yieldData} layout="horizontal">
              <CartesianGrid strokeDasharray="3 3" stroke="#f0f0f0" />
              <XAxis type="number" stroke="#6b7280" />
              <YAxis dataKey="crop" type="category" stroke="#6b7280" />
              <Tooltip />
              <Bar dataKey="current" fill="#10B981" />
              <Bar dataKey="potential" fill="#3B82F6" />
            </BarChart>
          </ResponsiveContainer>
          <div className="mt-4 flex justify-center space-x-4">
            <div className="flex items-center space-x-2">
              <div className="w-4 h-4 bg-green-500 rounded"></div>
              <span className="text-sm text-gray-600">Current Yield</span>
            </div>
            <div className="flex items-center space-x-2">
              <div className="w-4 h-4 bg-blue-500 rounded"></div>
              <span className="text-sm text-gray-600">Potential Yield</span>
            </div>
          </div>
        </div>
      </div>

      {/* Risk Assessment */}
      <div className="bg-white rounded-2xl shadow-xl p-6 border border-gray-100">
        <h2 className="text-xl font-bold text-gray-900 mb-6 flex items-center">
          <span className="mr-3">⚠️</span>
          Risk Assessment Matrix
        </h2>
        <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
          {riskFactors.map((risk, index) => (
            <div key={index} className="bg-gradient-to-br from-gray-50 to-red-50 rounded-2xl p-6 border border-gray-200">
              <div className="flex items-center justify-between mb-4">
                <h3 className="text-lg font-bold text-gray-900">{risk.factor}</h3>
                <span className={`px-3 py-1 rounded-full text-xs font-bold ${
                  risk.impact === 'High' ? 'bg-red-100 text-red-800' : 'bg-yellow-100 text-yellow-800'
                }`}>
                  {risk.impact} Impact
                </span>
              </div>
              
              <div className="space-y-3">
                <div>
                  <div className="flex justify-between mb-1">
                    <span className="text-sm text-gray-600">Probability</span>
                    <span className="text-sm font-bold text-gray-900">{risk.probability}%</span>
                  </div>
                  <div className="w-full bg-gray-200 rounded-full h-2">
                    <div 
                      className={`h-2 rounded-full ${
                        risk.probability >= 80 ? 'bg-red-500' :
                        risk.probability >= 60 ? 'bg-yellow-500' : 'bg-green-500'
                      }`}
                      style={{ width: `${risk.probability}%` }}
                    ></div>
                  </div>
                </div>
                
                <div className="bg-white rounded-xl p-3">
                  <p className="text-sm text-gray-600">
                    <strong>Mitigation:</strong> {risk.mitigation}
                  </p>
                </div>
              </div>
            </div>
          ))}
        </div>
      </div>

      {/* AI Insights */}
      <div className="bg-gradient-to-br from-purple-50 to-blue-50 rounded-2xl p-6 border border-purple-200">
        <h2 className="text-xl font-bold text-purple-900 mb-6 flex items-center">
          <span className="mr-3">🤖</span>
          AI-Powered Insights
        </h2>
        <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
          <div className="bg-white rounded-xl p-4">
            <h3 className="font-semibold text-gray-900 mb-2">🎯 Recommendation</h3>
            <p className="text-sm text-gray-600">
              Focus on yield improvement in Gujarat and Karnataka to achieve 2025 targets
            </p>
          </div>
          <div className="bg-white rounded-xl p-4">
            <h3 className="font-semibold text-gray-900 mb-2">📈 Prediction</h3>
            <p className="text-sm text-gray-600">
              Soybean production likely to increase by 15% with current interventions
            </p>
          </div>
          <div className="bg-white rounded-xl p-4">
            <h3 className="font-semibold text-gray-900 mb-2">⚡ Alert</h3>
            <p className="text-sm text-gray-600">
              Early monsoon withdrawal may impact mustard sowing in Rajasthan
            </p>
          </div>
        </div>
      </div>
    </div>
  )
}